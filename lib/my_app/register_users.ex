defmodule MyApp.RegisterUsers do
  import Ecto.Query, warn: false
  alias MyApp.Repo
  alias MyApp.RegisterUsers.Register
  def list_register_users do
    Repo.all(Register)
  end
  def get_register!(id), do: Repo.get!(Register, id)
  def create_register(attrs \\ %{}) do
    %Register{}
    |> Register.changeset(attrs)
    |> Repo.insert()
  end
  def update_register(%Register{} = register, attrs) do
    register
    |> Register.changeset(attrs)
    |> Repo.update()
  end
  def delete_register(%Register{} = register) do
    Repo.delete(register)
  end
  def change_register(%Register{} = register, attrs \\ %{}) do
    Register.changeset(register, attrs)
  end
end
