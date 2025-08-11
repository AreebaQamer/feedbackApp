defmodule MyAppWeb.RegisterController do
  use MyAppWeb , :controller
  alias MyApp.RegisterUsers
  alias MyApp.RegisterUsers.Register
     def register(conn , _params) do
      changeset = RegisterUsers.change_register(%Register{})
      render(conn, :new, changeset: changeset)
     end
    def register_user(conn, %{"register"=>register_params}) do
       case RegisterUsers.create_register(register_params) do
  {:ok, _user} ->
    conn
    |> put_flash(:info, "Registered successfully!")
    |> redirect(to: "/")
  {:error, changeset} ->
    changeset = %{changeset | action: :insert}
    render(conn, "new.html", changeset: changeset)
end

end

end
