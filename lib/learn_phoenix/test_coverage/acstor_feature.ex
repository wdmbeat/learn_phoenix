defmodule LearnPhoenix.TestCoverage.AcstorFeature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "acstor_features" do
    field :name, :string
    field :description, :string

    many_to_many :storage_types, LearnPhoenix.TestCoverage.StorageType,
      join_through: "acstor_features_storage_types"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(acstor_feature, attrs) do
    acstor_feature
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> put_assoc(:storage_types, parse_storage_types(attrs))
  end

  defp parse_storage_types(%{"storage_type_ids" => ids}) when is_list(ids) do
    Enum.map(ids, &get_storage_type/1)
  end

  defp parse_storage_types(_), do: []

  defp get_storage_type(id) do
    LearnPhoenix.TestCoverage.get_storage_type!(id)
  end
end
