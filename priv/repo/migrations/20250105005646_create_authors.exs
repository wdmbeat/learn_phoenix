defmodule LearnPhoenix.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :gender, :string
      add :bio, :string
      add :birth_date, :string

      timestamps(type: :utc_datetime)
    end
  end
end
