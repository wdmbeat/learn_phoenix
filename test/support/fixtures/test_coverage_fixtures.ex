defmodule LearnPhoenix.TestCoverageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.TestCoverage` context.
  """

  @doc """
  Generate a storage_type.
  """
  def storage_type_fixture(attrs \\ %{}) do
    {:ok, storage_type} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LearnPhoenix.TestCoverage.create_storage_type()

    storage_type
  end

  @doc """
  Generate a acstor_feature.
  """
  def acstor_feature_fixture(attrs \\ %{}) do
    {:ok, acstor_feature} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> LearnPhoenix.TestCoverage.create_acstor_feature()

    acstor_feature
  end
end
