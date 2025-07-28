defmodule MyAppWeb.FeedbackController do
use MyAppWeb, :controller
alias MyApp.Feedbacks
alias MyApp.Feedbacks.Feedback
 # apply changeset on feedback table
def new(conn, _params) do
  changeset = Feedbacks.change_feedback(%Feedback{})
  render(conn, :new, changeset: changeset)
end
 # insert feedback
 def create(conn, %{"feedback"=>feedback_params})do
     case Feedbacks.create_feedback(feedback_params) do
    {:ok, _feedback} ->
        conn
        |> put_flash(:info, "Thank you for your feedback!")
        |> redirect(to: ~p"/feedbacks")
    {:error, %Ecto.Changeset{} = changeset} ->
     render(conn, :new, changeset: changeset)
  end
end

   # greetings page
 def greetings(conn,_params) do
   render(conn,:greetings)
 end
  # update feedback
 def update(conn, %{"id" => id, "feedback" => feedback_params}) do
  feedback = Feedbacks.get_feedback!(String.to_integer(id))
  case Feedbacks.update_feedback(feedback, feedback_params) do
    {:ok, _updated_feedback} ->
      conn
      |> put_flash(:info, "Feedback updated successfully.")
      |> redirect(to: ~p"/feedbacks")
    {:error, changeset} ->
      render(conn, :edit , feedback: feedback, changeset: changeset)
  end
end
 # edit fields of feedback form
def edit(conn, %{"id" => id}) do
  feedback = Feedbacks.get_feedback!(String.to_integer(id))
  render(conn, :edit , feedback: feedback)
end
 # delete feedback
def delete(conn, %{"id" => id}) do
  feedback = Feedbacks.get_feedback!(String.to_integer(id))
  case Feedbacks.delete_feedback(feedback) do
    {:ok, _deleted_feedback} ->
      conn
      |> put_flash(:info, "Feedback deleted successfully.")
      |> redirect(to: ~p"/feedbacks")
    {:error, _} ->
      conn
      |> put_flash(:error, "Failed to delete feedback.")
      |> redirect(to: ~p"/feedbacks")
  end
end
# get feedback according to search
def get_feedback(conn, %{"search" => search_term}) do
    feedbacks =
      Feedbacks.list_feedback()
      |> Enum.filter(fn fb ->
        String.contains?(String.downcase(fb.firstname || ""), String.downcase(search_term))
      end)

    render(conn, :feedbacks, feedbacks: feedbacks, search: search_term)
  end
 # get all feedbacks
  def get_feedback(conn, _params) do
    feedbacks = Feedbacks.list_feedback()
    render(conn, :feedbacks, feedbacks: feedbacks, search: "")
  end

end
