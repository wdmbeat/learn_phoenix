defmodule LearnPhoenix.TestCoverage do
  @moduledoc """
  The TestCoverage context.
  """

  import Ecto.Query, warn: false
  alias LearnPhoenix.Repo

  alias LearnPhoenix.TestCoverage.StorageType

  @doc """
  Returns the list of storage_types.

  ## Examples

      iex> list_storage_types()
      [%StorageType{}, ...]

  """
  def list_storage_types do
    Repo.all(StorageType)
  end

  @doc """
  Gets a single storage_type.

  Raises `Ecto.NoResultsError` if the Storage type does not exist.

  ## Examples

      iex> get_storage_type!(123)
      %StorageType{}

      iex> get_storage_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_storage_type!(id), do: Repo.get!(StorageType, id)

  @doc """
  Creates a storage_type.

  ## Examples

      iex> create_storage_type(%{field: value})
      {:ok, %StorageType{}}

      iex> create_storage_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_storage_type(attrs \\ %{}) do
    %StorageType{}
    |> StorageType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a storage_type.

  ## Examples

      iex> update_storage_type(storage_type, %{field: new_value})
      {:ok, %StorageType{}}

      iex> update_storage_type(storage_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_storage_type(%StorageType{} = storage_type, attrs) do
    storage_type
    |> StorageType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a storage_type.

  ## Examples

      iex> delete_storage_type(storage_type)
      {:ok, %StorageType{}}

      iex> delete_storage_type(storage_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_storage_type(%StorageType{} = storage_type) do
    Repo.delete(storage_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking storage_type changes.

  ## Examples

      iex> change_storage_type(storage_type)
      %Ecto.Changeset{data: %StorageType{}}

  """
  def change_storage_type(%StorageType{} = storage_type, attrs \\ %{}) do
    StorageType.changeset(storage_type, attrs)
  end

  alias LearnPhoenix.TestCoverage.AcstorFeature

  @doc """
  Returns the list of acstor_features.

  ## Examples

      iex> list_acstor_features()
      [%AcstorFeature{}, ...]

  """
  def list_acstor_features do
    Repo.all(AcstorFeature)
  end

  @doc """
  Gets a single acstor_feature.

  Raises `Ecto.NoResultsError` if the Acstor feature does not exist.

  ## Examples

      iex> get_acstor_feature!(123)
      %AcstorFeature{}

      iex> get_acstor_feature!(456)
      ** (Ecto.NoResultsError)

  """
  def get_acstor_feature!(id), do: Repo.get!(AcstorFeature, id)

  @doc """
  Creates a acstor_feature.

  ## Examples

      iex> create_acstor_feature(%{field: value})
      {:ok, %AcstorFeature{}}

      iex> create_acstor_feature(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_acstor_feature(attrs \\ %{}) do
    %AcstorFeature{}
    |> AcstorFeature.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, acstor_feature} -> {:ok, Repo.preload(acstor_feature, :storage_types)}
      error -> error
    end
  end

  @doc """
  Updates a acstor_feature.

  ## Examples

      iex> update_acstor_feature(acstor_feature, %{field: new_value})
      {:ok, %AcstorFeature{}}

      iex> update_acstor_feature(acstor_feature, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_acstor_feature(%AcstorFeature{} = acstor_feature, attrs) do
    acstor_feature
    |> Repo.preload(:storage_types)
    |> AcstorFeature.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, updated_acstor_feature} -> {:ok, Repo.preload(updated_acstor_feature, :storage_types)}
      error -> error
    end
  end

  @doc """
  Deletes a acstor_feature.

  ## Examples

      iex> delete_acstor_feature(acstor_feature)
      {:ok, %AcstorFeature{}}

      iex> delete_acstor_feature(acstor_feature)
      {:error, %Ecto.Changeset{}}

  """
  def delete_acstor_feature(%AcstorFeature{} = acstor_feature) do
    Repo.delete(acstor_feature)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking acstor_feature changes.

  ## Examples

      iex> change_acstor_feature(acstor_feature)
      %Ecto.Changeset{data: %AcstorFeature{}}

  """
  def change_acstor_feature(%AcstorFeature{} = acstor_feature, attrs \\ %{}) do
    AcstorFeature.changeset(acstor_feature, attrs)
  end

  def preload_storage_types(acstor_feature) do
    Repo.preload(acstor_feature, :storage_types)
  end
end
