defmodule MyApp.Repo.Migrations.CreateFeedback do
  use Ecto.Migration

  def change do
    create table(:feedback) do
      add :firstname , :string
      add :lastname, :string
      add :email, :string
      add :feedback, :text

      timestamps(type: :utc_datetime)
    end
  end
end
