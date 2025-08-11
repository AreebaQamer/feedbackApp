defmodule MyAppWeb.ApiController do
  use MyAppWeb, :controller
  use PhoenixSwagger
  alias MyApp.Feedbacks

  # --------------------
  # Swagger paths
  # --------------------

  swagger_path :index do
    get "/api/hello"
    summary "Say hello"
    description "Returns a greeting"
    produces "application/json"
    response 200, "Success", Schema.ref(:HelloResponse)
  end

  swagger_path :get_feedbacks do
    get "/api/feedbacks"
    summary "Get all feedbacks"
    description "Returns the list of feedbacks"
    produces "application/json"
    response 200, "Success", Schema.array(:Feedback)
  end

  swagger_path :add_feedback do
  post "/api/add_feedbacks"
  summary "Add feedback"
  description "Add a new feedback entry"
  consumes "application/x-www-form-urlencoded"
  produces "application/json"

  parameter :firstname, :formData, :string, "First Name", required: true
  parameter :lastname, :formData, :string, "Last Name", required: true
  parameter :email, :formData, :string, "Email", required: true
  parameter :feedback, :formData, :string, "Feedback message", required: true

  response 200, "Success", Schema.ref(:FeedbackResponse)
  response 422, "Validation error"
end
swagger_path :update_feedback do
  put "/api/update_feedbacks/{id}"
  summary "Update feedback"
  description "Update an existing feedback entry"
  consumes "application/x-www-form-urlencoded"
  produces "application/json"

  parameter :id, :path, :integer, "Feedback ID", required: true
  parameter :firstname, :formData, :string, "First Name", required: true
  parameter :lastname, :formData, :string, "Last Name", required: true
  parameter :email, :formData, :string, "Email", required: true
  parameter :feedback, :formData, :string, "Feedback message", required: true

  response 200, "Success", Schema.ref(:Feedback_updateResponse)
  response 422, "Validation error"
end
  swagger_path :delete_feedback do
  PhoenixSwagger.Path.delete "/api/delete_feedbacks/{id}"
  summary "Delete feedback"
  description "Deletes a feedback entry by ID"
  parameter :id, :path, :integer, "Feedback ID", required: true
  response 200, "Deleted successfully"
  response 404, "Not found"
end


  # --------------------
  # Controller actions
  # --------------------

  def index(conn, _params) do
    json(conn, %{message: "Hello I am API"})
  end

  def get_feedbacks(conn, _params) do
    feedbacks = Feedbacks.concat_names()
    json(conn, %{data: feedbacks})
  end

def add_feedback(conn, params) do
    case Feedbacks.create_feedback(params) do
    {:ok, feedback} ->
      json(conn, %{
        status: "success",
        message: "Feedback created successfully",
        data: feedback
      })

    {:error, changeset} ->
      conn
      |> put_status(:unprocessable_entity)
      |> json(%{
        status: "error",
        errors: Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} -> msg end)
      })
  end
end

def update_feedback(conn, %{"id" => id} = params) do
  # Convert id string to integer safely
  case Integer.parse(id) do
    {int_id, ""} ->
      case Feedbacks.update_feedback_by_id(int_id, params) do
        {:ok, feedback} ->
          json(conn, %{
            status: "success",
            message: "Feedback updated successfully",
            data: feedback
          })

        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{
            status: "error",
            errors: Ecto.Changeset.traverse_errors(changeset, fn {msg, _opts} -> msg end)
          })
      end

    _ ->
      conn
      |> put_status(:bad_request)
      |> json(%{status: "error", message: "Invalid ID"})
  end
end
def delete_feedback(conn , %{"id"=> id}) do
  # Convert id string to integer safely
  case Integer.parse(id) do
    {int_id, ""} ->
      case Feedbacks.delete_feedback_by_id(int_id) do
        {:ok, _} ->
          json(conn, %{status: "success", message: "Feedback deleted successfully"})
          {:error, _} ->
            conn
            |> put_status(:unprocessable_entity)
            |> json(%{status: "error", message: "Failed to delete feedback"})

      end
  end

end
  # --------------------
  # Swagger definitions
  # --------------------

  def swagger_definitions do
    %{
      HelloResponse: swagger_schema do
        title "Hello response"
        description "Response for hello API"
        properties do
          message :string, "Response message", required: true
        end
        example %{message: "Hello from Phoenix + Swagger"}
      end,

      Feedback: swagger_schema do
        title "Feedback list response"
        description "Fetch all feedback responses"
        properties do
          id :integer, "ID", required: true
          firstname :string, "First Name", required: true
          lastname :string, "Last Name", required: true
          email :string, "Email", required: true
          feedback :string, "Feedback message", required: true
          user_id :integer, "User ID", required: true
          inserted_at :string, "Created at", format: "date-time", required: true
        end
        example %{
          id: 1,
          firstname: "Areeba",
          lastname: "Qamer",
          email: "areebaqamer14@gmail.com",
          feedback: "Great work!",
          user_id: 10,
          inserted_at: "2024-08-11T10:00:00Z"
        }
      end,

      FeedbackCreate: swagger_schema do
        title "Create feedback params"
        description "Parameters required to create feedback"
        properties do
          firstname :string, "First Name", required: true
          lastname :string, "Last Name", required: true
          email :string, "Email", required: true
          feedback :string, "Feedback message", required: true
        end
        example %{
          firstname: "Areeba",
          lastname: "Qamer",
          email: "areebaqamer14@gmail.com",
          feedback: "Great work!"
        }
      end,
      FeedbackUpdateCreate: swagger_schema do
        title "Update feedback params"
        description "Parameters required to update feedback"
        properties do
          firstname :string, "First Name", required: true
          lastname :string, "Last Name", required: true
          email :string, "Email", required: true
          feedback :string, "Feedback message", required: true
        end
        example %{
          firstname: "Areeba",
          lastname: "Qamer",
          email: "areebaqamer14@gmail.com",
          feedback: "Great work!"
        }
      end,
      Feedback_updateResponse: swagger_schema do
      title "Feedback update response"
      description "Response after updating feedback"
      properties do
       status :string, "Status", required: true
          message :string, "Message", required: true
          data Schema.ref(:Feedback), "Updated feedback data"
      end
       example %{
          firstname: "Areeba",
          lastname: "Qamer",
          email: "areebaqamer14@gmail.com",
          feedback: "Great work!"
        }
      end,

      FeedbackResponse: swagger_schema do
        title "Feedback response"
        description "Response for add feedback API"
        properties do
          status :string, "Status", required: true
          message :string, "Message", required: true
          data Schema.ref(:Feedback), "Created feedback data"
        end
        example %{
          status: "success",
          message: "Feedback created successfully",
          data: %{
            id: 1,
            firstname: "Areeba",
            lastname: "Qamer",
            email: "areebaqamer14@gmail.com",
            feedback: "Great work!",
            user_id: 10,
            inserted_at: "2024-08-11T10:00:00Z"
          }
        }
      end
    }
  end
end
