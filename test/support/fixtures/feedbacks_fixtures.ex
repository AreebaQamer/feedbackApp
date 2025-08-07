defmodule MyApp.FeedbacksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Feedbacks` context.
  """

  @doc """
  Generate a feedback.
  """
  def feedback_fixture(attrs \\ %{}) do
    {:ok, feedback} =
      attrs
      |> Enum.into(%{
        email: "some email",
        message: "some message",
        name: "some name"
      })
      |> MyApp.Feedbacks.create_feedback()

    feedback
  end
end
