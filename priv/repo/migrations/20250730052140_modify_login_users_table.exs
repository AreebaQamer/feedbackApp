defmodule MyApp.Repo.Migrations.ModifyLoginUsersTable do
  use Ecto.Migration

  def change do
    rename table(:login_users), :password, to: :password_hash
    

  end
end
