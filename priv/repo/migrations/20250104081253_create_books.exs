defmodule LearnPhoenix.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :genres, {:array, :string}

      timestamps(type: :utc_datetime)
    end

    # add an index on the genres
    execute("create index books_genres_index on books using gin (genres);")
  end
end
