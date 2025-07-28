defmodule MyApp.Feedbacks do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.Feedbacks.Feedback
   # list all feedbacks
  def list_feedback do
    Repo.all(Feedback)
  end
   #get feedback by id
  def get_feedback!(id), do: Repo.get!(Feedback, id)
 # create a new feedback
  def create_feedback(attrs \\ %{}) do
    %Feedback{}
    |> Feedback.changeset(attrs)
    |> Repo.insert()
  end
 # update current feedback
  def update_feedback(%Feedback{} = feedback, attrs) do
    feedback
    |> Feedback.changeset(attrs)
    |> Repo.update()
  end
  # delete a feedback
  def delete_feedback(%Feedback{} = feedback) do
    Repo.delete(feedback)
  end
  # change feedback status
  def change_feedback(%Feedback{} = feedback, attrs \\ %{}) do
    Feedback.changeset(feedback, attrs)
  end
end
