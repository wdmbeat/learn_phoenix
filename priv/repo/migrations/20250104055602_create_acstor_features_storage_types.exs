defmodule LearnPhoenix.Repo.Migrations.CreateAcstorFeaturesStorageTypes do
  use Ecto.Migration

  def change do
    create table(:acstor_features_storage_types) do
      add :acstor_feature_id, references(:acstor_features, on_delete: :delete_all)
      add :storage_type_id, references(:storage_types, on_delete: :delete_all)
    end

    create unique_index(:acstor_features_storage_types, [:acstor_feature_id, :storage_type_id])
  end
end
