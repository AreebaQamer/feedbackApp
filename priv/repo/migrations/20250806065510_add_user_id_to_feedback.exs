defmodule MyApp.Repo.Migrations.AddUserIdToFeedback do
  use Ecto.Migration

  def change do
    alter table(:feedback) do
      add :user_id ,references(:login_users , on_delete:  :delete_all)
    end
    create_index(:feedback ,[:user_id])
  end
end
