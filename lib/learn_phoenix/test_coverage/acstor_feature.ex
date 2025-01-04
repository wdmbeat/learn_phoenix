defmodule LearnPhoenix.TestCoverage.AcstorFeature do
  use Ecto.Schema
  import Ecto.Changeset

  schema "acstor_features" do
    field :name, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(acstor_feature, attrs) do
    acstor_feature
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
