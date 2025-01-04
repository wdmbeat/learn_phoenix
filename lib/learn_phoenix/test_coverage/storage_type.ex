defmodule LearnPhoenix.TestCoverage.StorageType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storage_types" do
    field :name, :string
    many_to_many :acstor_features, LearnPhoenix.TestCoverage.AcstorFeature, join_through: "acstor_features_storage_types"
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(storage_type, attrs) do
    storage_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
