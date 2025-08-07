defmodule MyApp.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Accounts` context.
  """

  @doc """
  Generate a feedback.
  """
  def feedback_fixture(attrs \\ %{}) do
    {:ok, feedback} =
      attrs
      |> Enum.into(%{
        email: "some email",
        feedback: "some feedback",
        name: "some name"
      })
      |> MyApp.Accounts.create_feedback()

    feedback
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password_hash: "some password_hash"
      })
      |> MyApp.Accounts.create_user()

    user
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password"
      })
      |> MyApp.Accounts.create_user()

    user
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
      |> MyApp.Accounts.create_login()

    login
  end
end
