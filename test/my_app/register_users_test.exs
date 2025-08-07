defmodule MyApp.RegisterUsersTest do
  use MyApp.DataCase

  alias MyApp.RegisterUsers

  describe "register_users" do
    alias MyApp.RegisterUsers.Register

    import MyApp.RegisterUsersFixtures

    @invalid_attrs %{name: nil, status: nil, password: nil, age: nil, email: nil}

    test "list_register_users/0 returns all register_users" do
      register = register_fixture()
      assert RegisterUsers.list_register_users() == [register]
    end

    test "get_register!/1 returns the register with given id" do
      register = register_fixture()
      assert RegisterUsers.get_register!(register.id) == register
    end

    test "create_register/1 with valid data creates a register" do
      valid_attrs = %{name: "some name", status: "some status", password: "some password", age: 42, email: "some email"}

      assert {:ok, %Register{} = register} = RegisterUsers.create_register(valid_attrs)
      assert register.name == "some name"
      assert register.status == "some status"
      assert register.password == "some password"
      assert register.age == 42
      assert register.email == "some email"
    end

    test "create_register/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RegisterUsers.create_register(@invalid_attrs)
    end

    test "update_register/2 with valid data updates the register" do
      register = register_fixture()
      update_attrs = %{name: "some updated name", status: "some updated status", password: "some updated password", age: 43, email: "some updated email"}

      assert {:ok, %Register{} = register} = RegisterUsers.update_register(register, update_attrs)
      assert register.name == "some updated name"
      assert register.status == "some updated status"
      assert register.password == "some updated password"
      assert register.age == 43
      assert register.email == "some updated email"
    end

    test "update_register/2 with invalid data returns error changeset" do
      register = register_fixture()
      assert {:error, %Ecto.Changeset{}} = RegisterUsers.update_register(register, @invalid_attrs)
      assert register == RegisterUsers.get_register!(register.id)
    end

    test "delete_register/1 deletes the register" do
      register = register_fixture()
      assert {:ok, %Register{}} = RegisterUsers.delete_register(register)
      assert_raise Ecto.NoResultsError, fn -> RegisterUsers.get_register!(register.id) end
    end

    test "change_register/1 returns a register changeset" do
      register = register_fixture()
      assert %Ecto.Changeset{} = RegisterUsers.change_register(register)
    end
  end
end
