defmodule MyApp.Feedbacks.Feedback do
  use Ecto.Schema
  import Ecto.Changeset
  schema "feedback" do
    field :firstname, :string
    field :lastname , :string
    field :email, :string
    field :feedback, :string
    timestamps()
  end
  def changeset(feedback, attrs) do
    feedback
    |> cast(attrs, [:firstname, :lastname , :email, :feedback])
    |> validate_required([:firstname, :lastname , :email])
    |> validate_format(:email, ~r/@/)
   |> validate_length(:feedback, max: 300, message: "Feedback cannot be longer than 300 characters.")

  end
end
