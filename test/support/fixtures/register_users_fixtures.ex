defmodule MyApp.RegisterUsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.RegisterUsers` context.
  """

  @doc """
  Generate a register.
  """
  def register_fixture(attrs \\ %{}) do
    {:ok, register} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        name: "some name",
        password: "some password",
        status: "some status"
      })
      |> MyApp.RegisterUsers.create_register()

    register
  end
end
