defmodule LearnPhoenixWeb.AcstorFeatureController do
  use LearnPhoenixWeb, :controller

  alias LearnPhoenix.TestCoverage
  alias LearnPhoenix.TestCoverage.AcstorFeature

  def index(conn, _params) do
    acstor_features = TestCoverage.list_acstor_features()
    render(conn, :index, acstor_features: acstor_features)
  end

  def new(conn, _params) do
    changeset = TestCoverage.change_acstor_feature(%AcstorFeature{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"acstor_feature" => acstor_feature_params}) do
    case TestCoverage.create_acstor_feature(acstor_feature_params) do
      {:ok, acstor_feature} ->
        conn
        |> put_flash(:info, "Acstor feature created successfully.")
        |> redirect(to: ~p"/acstor_features/#{acstor_feature}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    acstor_feature = TestCoverage.get_acstor_feature!(id)
    render(conn, :show, acstor_feature: acstor_feature)
  end

  def edit(conn, %{"id" => id}) do
    acstor_feature = TestCoverage.get_acstor_feature!(id)
    changeset = TestCoverage.change_acstor_feature(acstor_feature)
    render(conn, :edit, acstor_feature: acstor_feature, changeset: changeset)
  end

  def update(conn, %{"id" => id, "acstor_feature" => acstor_feature_params}) do
    acstor_feature = TestCoverage.get_acstor_feature!(id)

    case TestCoverage.update_acstor_feature(acstor_feature, acstor_feature_params) do
      {:ok, acstor_feature} ->
        conn
        |> put_flash(:info, "Acstor feature updated successfully.")
        |> redirect(to: ~p"/acstor_features/#{acstor_feature}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, acstor_feature: acstor_feature, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    acstor_feature = TestCoverage.get_acstor_feature!(id)
    {:ok, _acstor_feature} = TestCoverage.delete_acstor_feature(acstor_feature)

    conn
    |> put_flash(:info, "Acstor feature deleted successfully.")
    |> redirect(to: ~p"/acstor_features")
  end
end
