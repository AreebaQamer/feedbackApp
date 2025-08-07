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
      {:ok, _user} ->
        conn
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
def signup_create(conn, login_params) do
   case Accounts.create_login(login_params) do
    {:ok, _user} ->
      conn
      |> put_flash(:info, "You have registered  successfully.")
      |> redirect(to: "/")
      {:error, changeset} ->
        conn
      |> put_flash(:error, "Registration failed.")
      |> render(:signup, changeset: changeset)
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


end
