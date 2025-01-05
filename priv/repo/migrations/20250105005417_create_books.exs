defmodule LearnPhoenix.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :price, :decimal
      add :publication_date, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
