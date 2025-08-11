
defmodule MyAppWeb.Profile do
  import Plug.Conn
  alias MyApp.Accounts

  def fetch_current_user(conn, _opts) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Accounts.get_login!(user_id) ->
        assign(conn, :current_user, user)

      true ->
        assign(conn, :current_user, nil)
    end
  end
end
