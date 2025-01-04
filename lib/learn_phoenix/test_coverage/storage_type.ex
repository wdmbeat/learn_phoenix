defmodule LearnPhoenix.TestCoverage.StorageType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storage_types" do
    field :name, :string

    many_to_many :acstor_features, LearnPhoenix.TestCoverage.AcstorFeature,
      join_through: "acstor_features_storage_types",
      on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(storage_type, attrs) do
    storage_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def changeset_update_acstor_features(
        %LearnPhoenix.TestCoverage.StorageType{} = storage_type,
        acstor_features
      ) do
    storage_type
    |> cast(%{}, [:name])
    |> put_assoc(:acstor_features, acstor_features)
  end
end
