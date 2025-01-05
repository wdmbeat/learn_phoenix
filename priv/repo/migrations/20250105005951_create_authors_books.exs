defmodule LearnPhoenix.Repo.Migrations.CreateAuthorsBooks do
  use Ecto.Migration

  def change do
    create table(:authors_books) do
      add :position, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
