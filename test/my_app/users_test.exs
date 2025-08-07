defmodule MyApp.UsersTest do
  use MyApp.DataCase

  alias MyApp.Users

  describe "users" do
    alias MyApp.Users.Login

    import MyApp.UsersFixtures

    @invalid_attrs %{email: nil, password_hash: nil}

    test "list_users/0 returns all users" do
      login = login_fixture()
      assert Users.list_users() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert Users.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{email: "some email", password_hash: "some password_hash"}

      assert {:ok, %Login{} = login} = Users.create_login(valid_attrs)
      assert login.email == "some email"
      assert login.password_hash == "some password_hash"
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{email: "some updated email", password_hash: "some updated password_hash"}

      assert {:ok, %Login{} = login} = Users.update_login(login, update_attrs)
      assert login.email == "some updated email"
      assert login.password_hash == "some updated password_hash"
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_login(login, @invalid_attrs)
      assert login == Users.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = Users.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> Users.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = Users.change_login(login)
    end
  end

  describe "login_users" do
    alias MyApp.Users.Login

    import MyApp.UsersFixtures

    @invalid_attrs %{email: nil, password_hash: nil}

    test "list_login_users/0 returns all login_users" do
      login = login_fixture()
      assert Users.list_login_users() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert Users.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{email: "some email", password_hash: "some password_hash"}

      assert {:ok, %Login{} = login} = Users.create_login(valid_attrs)
      assert login.email == "some email"
      assert login.password_hash == "some password_hash"
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{email: "some updated email", password_hash: "some updated password_hash"}

      assert {:ok, %Login{} = login} = Users.update_login(login, update_attrs)
      assert login.email == "some updated email"
      assert login.password_hash == "some updated password_hash"
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_login(login, @invalid_attrs)
      assert login == Users.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = Users.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> Users.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = Users.change_login(login)
    end
  end

  describe "users" do
    alias MyApp.Users.Login

    import MyApp.UsersFixtures

    @invalid_attrs %{password: nil, email: nil}

    test "list_users/0 returns all users" do
      login = login_fixture()
      assert Users.list_users() == [login]
    end

    test "get_login!/1 returns the login with given id" do
      login = login_fixture()
      assert Users.get_login!(login.id) == login
    end

    test "create_login/1 with valid data creates a login" do
      valid_attrs = %{password: "some password", email: "some email"}

      assert {:ok, %Login{} = login} = Users.create_login(valid_attrs)
      assert login.password == "some password"
      assert login.email == "some email"
    end

    test "create_login/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_login(@invalid_attrs)
    end

    test "update_login/2 with valid data updates the login" do
      login = login_fixture()
      update_attrs = %{password: "some updated password", email: "some updated email"}

      assert {:ok, %Login{} = login} = Users.update_login(login, update_attrs)
      assert login.password == "some updated password"
      assert login.email == "some updated email"
    end

    test "update_login/2 with invalid data returns error changeset" do
      login = login_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_login(login, @invalid_attrs)
      assert login == Users.get_login!(login.id)
    end

    test "delete_login/1 deletes the login" do
      login = login_fixture()
      assert {:ok, %Login{}} = Users.delete_login(login)
      assert_raise Ecto.NoResultsError, fn -> Users.get_login!(login.id) end
    end

    test "change_login/1 returns a login changeset" do
      login = login_fixture()
      assert %Ecto.Changeset{} = Users.change_login(login)
    end
  end
end
