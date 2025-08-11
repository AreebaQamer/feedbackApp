defmodule MyApp.Feedbacks.Feedback do
  use Ecto.Schema
  import Ecto.Changeset
    @derive {Jason.Encoder, only: [:id, :firstname, :lastname, :email, :feedback]}
  schema "feedback" do
    field :firstname, :string
    field :lastname ,:string
    field :email, :string
    field :feedback, :string
    belongs_to :user, MyApp.Accounts.Login, foreign_key: :user_id
    timestamps(type: :utc_datetime)
  end
  @doc false
  def changeset(feedback, attrs) do
    feedback
    |> cast(attrs, [:firstname, :lastname , :email, :feedback ,:user_id])
    end
end
