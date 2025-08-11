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
 def create(conn, %{"feedback" => feedback_params}) do
  user_id = get_session(conn, :user_id)

  # Ensure user is logged in
  if user_id do
    feedback_params = Map.put(feedback_params, "user_id", user_id)

    case Feedbacks.create_feedback(feedback_params) do
      {:ok, _feedback} ->
        conn
        |> put_flash(:info, "Feedback created successfully.")
        |> redirect(to: ~p"/feedbacks/user")
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  else
    conn
    |> put_flash(:error, "Please log in to leave feedback.")
    |> redirect(to: ~p"/user/login")
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
def get_feedback(conn, %{"search" => search_term}) when byte_size(search_term) > 0 do
  feedbacks = Feedbacks.search_feedback_by_firstname(search_term)
  render(conn, :feedbacks, feedbacks: feedbacks, search: search_term)
end
def get_feedback(conn, _params) do
     user_name = get_session(conn , :user_name)
    if user_name == "admin" do
      feedbacks = Feedbacks.list_feedback()
      render(conn, :feedbacks, feedbacks: feedbacks, search: "")
  else
    conn
    |> put_flash(:info , "Please first login to view your feedback")
    |> redirect(to: ~p"/user/login")
    |> halt()

  end
end
def get_feedback_by_user_id(conn, _params) do
  case get_session(conn, :user_id) do
    nil ->
      conn
      |> put_flash(:error, "Please login to view your feedbacks")
      |> redirect(to: ~p"/user/login")
      |> halt()

    user_id ->
      feedbacks = Feedbacks.list_feedbacks_by_userid(user_id)
      render(conn, :userfeedbacks, user_feedbacks: feedbacks)
  end
end
end
