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
  def get_latest_feedback do
  Repo.one(from f in Feedback, order_by: [desc: f.inserted_at], limit: 1)
end
 # Optimized search by firstname
  def search_feedback_by_firstname(search_term) do
    from(f in Feedback,
      where: ilike(f.firstname, ^"%#{search_term}%")
    )
    |> Repo.all()
  end

  def list_feedbacks_by_userid(user_id) do
     from(f in Feedback,
     where: f.user_id == ^user_id,
     select: f
   )
   |> Repo.all()
end
def concat_names() do
  from(f in Feedback,
    select: %{
      id: f.id,
      name: fragment("concat(?, ' ', ?)", f.firstname, f.lastname),
      email: f.email,
      feedback: f.feedback,

    }
  )
  |> Repo.all()
end

def update_feedback_by_id(id, attrs) do
  case Repo.get(Feedback, id) do
    nil -> {:error, %{message: "Feedback not found"}}
    feedback -> update_feedback(feedback, attrs)
  end
end
def delete_feedback_by_id(id) do
 case Repo.get(Feedback , id) do
  nil ->
    {:error , %{ message: "Feedback not found"}}
    feedback -> delete_feedback(feedback)
 end
end

end
