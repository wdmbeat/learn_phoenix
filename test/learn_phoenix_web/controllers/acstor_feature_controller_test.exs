defmodule LearnPhoenixWeb.AcstorFeatureControllerTest do
  use LearnPhoenixWeb.ConnCase

  import LearnPhoenix.TestCoverageFixtures

  @create_attrs %{name: "some name", description: "some description"}
  @update_attrs %{name: "some updated name", description: "some updated description"}
  @invalid_attrs %{name: nil, description: nil}

  describe "index" do
    test "lists all acstor_features", %{conn: conn} do
      conn = get(conn, ~p"/acstor_features")
      assert html_response(conn, 200) =~ "Listing Acstor features"
    end
  end

  describe "new acstor_feature" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/acstor_features/new")
      assert html_response(conn, 200) =~ "New Acstor feature"
    end
  end

  describe "create acstor_feature" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/acstor_features", acstor_feature: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/acstor_features/#{id}"

      conn = get(conn, ~p"/acstor_features/#{id}")
      assert html_response(conn, 200) =~ "Acstor feature #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/acstor_features", acstor_feature: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Acstor feature"
    end
  end

  describe "edit acstor_feature" do
    setup [:create_acstor_feature]

    test "renders form for editing chosen acstor_feature", %{conn: conn, acstor_feature: acstor_feature} do
      conn = get(conn, ~p"/acstor_features/#{acstor_feature}/edit")
      assert html_response(conn, 200) =~ "Edit Acstor feature"
    end
  end

  describe "update acstor_feature" do
    setup [:create_acstor_feature]

    test "redirects when data is valid", %{conn: conn, acstor_feature: acstor_feature} do
      conn = put(conn, ~p"/acstor_features/#{acstor_feature}", acstor_feature: @update_attrs)
      assert redirected_to(conn) == ~p"/acstor_features/#{acstor_feature}"

      conn = get(conn, ~p"/acstor_features/#{acstor_feature}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, acstor_feature: acstor_feature} do
      conn = put(conn, ~p"/acstor_features/#{acstor_feature}", acstor_feature: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Acstor feature"
    end
  end

  describe "delete acstor_feature" do
    setup [:create_acstor_feature]

    test "deletes chosen acstor_feature", %{conn: conn, acstor_feature: acstor_feature} do
      conn = delete(conn, ~p"/acstor_features/#{acstor_feature}")
      assert redirected_to(conn) == ~p"/acstor_features"

      assert_error_sent 404, fn ->
        get(conn, ~p"/acstor_features/#{acstor_feature}")
      end
    end
  end

  defp create_acstor_feature(_) do
    acstor_feature = acstor_feature_fixture()
    %{acstor_feature: acstor_feature}
  end
end
