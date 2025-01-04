defmodule LearnPhoenixWeb.StorageTypeController do
  use LearnPhoenixWeb, :controller

  alias LearnPhoenix.TestCoverage
  alias LearnPhoenix.TestCoverage.StorageType

  def index(conn, _params) do
    storage_types = TestCoverage.list_storage_types()
    render(conn, :index, storage_types: storage_types)
  end

  def new(conn, _params) do
    changeset = TestCoverage.change_storage_type(%StorageType{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"storage_type" => storage_type_params}) do
    case TestCoverage.create_storage_type(storage_type_params) do
      {:ok, storage_type} ->
        conn
        |> put_flash(:info, "Storage type created successfully.")
        |> redirect(to: ~p"/storage_types/#{storage_type}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    storage_type = TestCoverage.get_storage_type!(id)
    render(conn, :show, storage_type: storage_type)
  end

  def edit(conn, %{"id" => id}) do
    storage_type = TestCoverage.get_storage_type!(id)
    changeset = TestCoverage.change_storage_type(storage_type)
    render(conn, :edit, storage_type: storage_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "storage_type" => storage_type_params}) do
    storage_type = TestCoverage.get_storage_type!(id)

    case TestCoverage.update_storage_type(storage_type, storage_type_params) do
      {:ok, storage_type} ->
        conn
        |> put_flash(:info, "Storage type updated successfully.")
        |> redirect(to: ~p"/storage_types/#{storage_type}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, storage_type: storage_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    storage_type = TestCoverage.get_storage_type!(id)
    {:ok, _storage_type} = TestCoverage.delete_storage_type(storage_type)

    conn
    |> put_flash(:info, "Storage type deleted successfully.")
    |> redirect(to: ~p"/storage_types")
  end
end
