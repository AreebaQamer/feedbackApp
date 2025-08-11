defmodule MyAppWeb.UserController do
use MyAppWeb, :controller
alias MyApp.Accounts
alias MyApp.Accounts.Login

  def login_new(conn, _params) do
    changeset = Accounts.change_login(%Login{})
    render(conn, :login , changeset: changeset)
  end
  def login_create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> put_session(:user_id , user.id)
        |> put_session(:user_name ,user.name)
        |> put_flash(:info, "Logged in successfully.")
        |> redirect(to: "/")
      {:error, :invalid_password} ->
        conn
        |> put_flash(:error, "Invalid password.")
        |> render("login.html")
      {:error, :user_not_found} ->
        conn
        |> put_flash(:error, "User not found.")
        |> render("login.html")
    end
  end
  def signup_new(conn,_params) do
    changeset = Accounts.change_login(%Login{})
    render(conn,:signup , changeset: changeset)
  end
def signup_create(conn, %{"name" => name, "email" => email, "password" => password, "confirm_password" => confirm}) do
  if password != confirm do
    changeset = MyApp.Accounts.change_login(%MyApp.Accounts.Login{})
    conn
    |> put_flash(:error, "Passwords do not match")
    |> render(:signup, changeset: changeset)
  else
    case MyApp.Accounts.create_login(%{name: name, email: email, password: password}) do
      {:ok, _user} ->
        conn
        |> redirect(to: "/user/login")
        |> put_flash(:info , "Account created succesfully")
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Signup Failed")
        |> render(:signup, changeset: changeset)
    end
  end
end
  def get_users(conn , _params) do
    users = Accounts.list_login_users()
    render(conn, :users , users: users)
  end
  def get_userfeedbacks(conn, %{"user_id"=> user_id}) do
    user_feedbacks = Accounts.list_feedbacks_by_user_id(user_id)
    render(conn, :user_feedbacks, user_feedbacks: user_feedbacks)
  end
def logout(conn, _params) do
  conn
  |> configure_session(drop: true)
  |> redirect(to: ~p"/user/login")
end


end
