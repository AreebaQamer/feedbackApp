defmodule MyApp.Repo.Migrations.CreateRegisterUsers do
  use Ecto.Migration

  def change do
    create table(:register_users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password, :string
      add :status, :string

      timestamps(type: :utc_datetime)
    end
  end
end
