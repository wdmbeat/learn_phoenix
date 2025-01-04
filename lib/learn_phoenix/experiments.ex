defmodule LearnPhoenix.Experiments do
  @moduledoc """
  The Experiments context.
  """

  import Ecto.Query, warn: false
  alias LearnPhoenix.Repo

  alias LearnPhoenix.Experiments.Workload

  @doc """
  Returns the list of workloads.

  ## Examples

      iex> list_workloads()
      [%Workload{}, ...]

  """
  def list_workloads do
    Repo.all(Workload)
  end

  @doc """
  Gets a single workload.

  Raises `Ecto.NoResultsError` if the Workload does not exist.

  ## Examples

      iex> get_workload!(123)
      %Workload{}

      iex> get_workload!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workload!(id), do: Repo.get!(Workload, id)

  @doc """
  Creates a workload.

  ## Examples

      iex> create_workload(%{field: value})
      {:ok, %Workload{}}

      iex> create_workload(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workload(attrs \\ %{}) do
    %Workload{}
    |> Workload.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workload.

  ## Examples

      iex> update_workload(workload, %{field: new_value})
      {:ok, %Workload{}}

      iex> update_workload(workload, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workload(%Workload{} = workload, attrs) do
    workload
    |> Workload.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workload.

  ## Examples

      iex> delete_workload(workload)
      {:ok, %Workload{}}

      iex> delete_workload(workload)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workload(%Workload{} = workload) do
    Repo.delete(workload)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workload changes.

  ## Examples

      iex> change_workload(workload)
      %Ecto.Changeset{data: %Workload{}}

  """
  def change_workload(%Workload{} = workload, attrs \\ %{}) do
    Workload.changeset(workload, attrs)
  end
end
