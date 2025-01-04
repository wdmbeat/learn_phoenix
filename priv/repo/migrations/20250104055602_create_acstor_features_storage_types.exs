defmodule LearnPhoenix.Repo.Migrations.CreateAcstorFeaturesStorageTypes do
  use Ecto.Migration

  def change do
    create table(:acstor_features_storage_types, primary_key: false) do
      add :acstor_feature_id,
          references(:acstor_features, on_delete: :delete_all),
          primary_key: true

      add :storage_type_id, references(:storage_types, on_delete: :delete_all), primary_key: true
    end

    create index(:acstor_features_storage_types, [:acstor_feature_id])
    create index(:acstor_features_storage_types, [:storage_type_id])
  end
end
