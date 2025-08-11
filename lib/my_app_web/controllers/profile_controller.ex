defmodule MyAppWeb.ProfileController do
  use MyAppWeb, :controller
  def profile(conn , _params) do
    render(conn , :index)
end
end
