defmodule MyApp.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Users` context.
  """

  @doc """
  Generate a login.
  """
  def login_fixture(attrs \\ %{}) do
    {:ok, login} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password_hash: "some password_hash"
      })
      |> MyApp.Users.create_login()

    login
  end

  @doc """
  Generate a login.
  """
  def login_fixture(attrs \\ %{}) do
    {:ok, login} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password"
      })
      |> MyApp.Users.create_login()

    login
  end
end
