defmodule LearnPhoenix.Repo.Migrations.CreateAcstorFeatures do
  use Ecto.Migration

  def change do
    create table(:acstor_features) do
      add :name, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
