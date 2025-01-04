defmodule LearnPhoenix.Experiments.Workload do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workloads" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workload, attrs) do
    workload
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
