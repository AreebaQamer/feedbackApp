
defmodule MyApp.Repo.Migrations.UpdateFeedbackField do
  use Ecto.Migration
  def change do
    rename table(:feedback), :name, to: :firstname
    alter table(:feedback) do
      modify :feedback, :text
      add :lastname, :string
    end
  end
end
