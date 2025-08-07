defmodule MyApp.Accounts.Login do
  use Ecto.Schema
  import Ecto.Changeset
  schema "login_users" do
    field :name, :string
    field :email, :string
    field :password, :string , virtual: true
    field :password_hash, :string
    has_many :feedbacks, MyApp.Feedbacks.Feedback, foreign_key: :user_id
    timestamps()
  end
  @doc false
  def changeset(login, attrs) do
    login
    |> cast(attrs, [:name, :email, :password, :password_hash])
    |> validate_required([:name ,:email, :password])
    |> unique_constraint(:email)
    |> put_pass_hash()
  end
  defp put_pass_hash(changeset) do
    case get_change(changeset, :password) do
      nil -> changeset
      password -> put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
    end
  end
end
