defmodule MyApp.Accounts do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.Accounts.Login
  alias MyApp.Feedbacks.Feedback

  def list_login_users do
    Repo.all(Login)
  end
  def get_login!(id), do: Repo.get!(Login, id)

  def create_login(attrs \\ %{}) do
    %Login{}
    |> Login.changeset(attrs)
    |> Repo.insert()
  end

  def update_login(%Login{} = login, attrs) do
    login
    |> Login.changeset(attrs)
    |> Repo.update()
  end

  def delete_login(%Login{} = login) do
    Repo.delete(login)
  end

  def change_login(%Login{} = login, attrs \\ %{}) do
    Login.changeset(login, attrs)
  end

  def authenticate_user(email, password) do
    user = Repo.get_by(Login, email: email)
    cond do
      user && Pbkdf2.verify_pass(password, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :invalid_password}

      true ->
        {:error, :user_not_found}
    end
  end
   def list_feedbacks_by_user_id(user_id) do
     from(f in Feedback,
     join:  u in  assoc( f, :user),
     where: f.user_id == ^user_id,
     select: f
   )
   |> Repo.all()
   end

end
