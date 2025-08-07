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

  describe "users" do
    alias MyApp.Accounts.User

    import MyApp.AccountsFixtures

    @invalid_attrs %{email: nil, password_hash: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password_hash: "some password_hash"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password_hash: "some updated password_hash"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias MyApp.Accounts.User

    import MyApp.AccountsFixtures

    @invalid_attrs %{password: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{password: "some password", email: "some email"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.password == "some password"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{password: "some updated password", email: "some updated email"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.password == "some updated password"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias MyApp.Accounts.Login

    import MyApp.AccountsFixtures

    @invalid_attrs %{password: nil, email: nil}

    test "list_users/0 returns all users" do
      login = login_fixture()
      assert Accounts.list_users() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert Accounts.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{password: "some password", email: "some email"}

      assert {:ok, %Login{} = login} = Accounts.create_login(valid_attrs)
      assert login.password == "some password"
      assert login.email == "some email"
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{password: "some updated password", email: "some updated email"}

      assert {:ok, %Login{} = login} = Accounts.update_login(login, update_attrs)
      assert login.password == "some updated password"
      assert login.email == "some updated email"
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_login(login, @invalid_attrs)
      assert login == Accounts.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = Accounts.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = Accounts.change_login(login)
    end
  end

  describe "login_users" do
    alias MyApp.Accounts.Login

    import MyApp.AccountsFixtures

    @invalid_attrs %{password: nil, email: nil}

    test "list_login_users/0 returns all login_users" do
      login = login_fixture()
      assert Accounts.list_login_users() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert Accounts.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{password: "some password", email: "some email"}

      assert {:ok, %Login{} = login} = Accounts.create_login(valid_attrs)
      assert login.password == "some password"
      assert login.email == "some email"
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{password: "some updated password", email: "some updated email"}

      assert {:ok, %Login{} = login} = Accounts.update_login(login, update_attrs)
      assert login.password == "some updated password"
      assert login.email == "some updated email"
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_login(login, @invalid_attrs)
      assert login == Accounts.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = Accounts.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = Accounts.change_login(login)
    end
  end
end
