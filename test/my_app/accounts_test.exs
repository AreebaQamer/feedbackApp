defmodule MyApp.AccountsTest do
  use MyApp.DataCase

  alias MyApp.Accounts

  describe "feedback" do
    alias MyApp.Accounts.Feedback

    import MyApp.AccountsFixtures

    @invalid_attrs %{name: nil, email: nil, feedback: nil}

    test "list_feedback/0 returns all feedback" do
      feedback = feedback_fixture()
      assert Accounts.list_feedback() == [feedback]
    end

    test "get_feedback!/1 returns the feedback with given id" do
      feedback = feedback_fixture()
      assert Accounts.get_feedback!(feedback.id) == feedback
    end

    test "create_feedback/1 with valid data creates a feedback" do
      valid_attrs = %{name: "some name", email: "some email", feedback: "some feedback"}

      assert {:ok, %Feedback{} = feedback} = Accounts.create_feedback(valid_attrs)
      assert feedback.name == "some name"
      assert feedback.email == "some email"
      assert feedback.feedback == "some feedback"
    end

    test "create_feedback/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_feedback(@invalid_attrs)
    end

    test "update_feedback/2 with valid data updates the feedback" do
      feedback = feedback_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", feedback: "some updated feedback"}

      assert {:ok, %Feedback{} = feedback} = Accounts.update_feedback(feedback, update_attrs)
      assert feedback.name == "some updated name"
      assert feedback.email == "some updated email"
      assert feedback.feedback == "some updated feedback"
    end

    test "update_feedback/2 with invalid data returns error changeset" do
      feedback = feedback_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_feedback(feedback, @invalid_attrs)
      assert feedback == Accounts.get_feedback!(feedback.id)
    end

    test "delete_feedback/1 deletes the feedback" do
      feedback = feedback_fixture()
      assert {:ok, %Feedback{}} = Accounts.delete_feedback(feedback)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_feedback!(feedback.id) end
    end

    test "change_feedback/1 returns a feedback changeset" do
      feedback = feedback_fixture()
      assert %Ecto.Changeset{} = Accounts.change_feedback(feedback)
    end
  end
end
