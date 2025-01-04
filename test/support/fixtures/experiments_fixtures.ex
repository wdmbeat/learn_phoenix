defmodule LearnPhoenix.ExperimentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.Experiments` context.
  """

  @doc """
  Generate a workload.
  """
  def workload_fixture(attrs \\ %{}) do
    {:ok, workload} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LearnPhoenix.Experiments.create_workload()

    workload
  end
end
