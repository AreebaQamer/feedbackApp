defmodule MyApp.Repo.Migrations.CreateLoginUsers do
  use Ecto.Migration

  def change do
    create table(:login_users) do
      add :name ,:string
      add :email, :string
      add :password_hash, :string

      timestamps(type: :utc_datetime)
    end
      create unique_index(:login_users, [:email])

  end
end
