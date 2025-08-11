defmodule MyApp.Repo.Migrations.AddUniqueIndexToEmail do
  use Ecto.Migration
  def change do
  create unique_index(:login_users, [:email])
end
end
