defmodule LearnPhoenixWeb.StorageTypeControllerTest do
  use LearnPhoenixWeb.ConnCase

  import LearnPhoenix.TestCoverageFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all storage_types", %{conn: conn} do
      conn = get(conn, ~p"/storage_types")
      assert html_response(conn, 200) =~ "Listing Storage types"
    end
  end

  describe "new storage_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/storage_types/new")
      assert html_response(conn, 200) =~ "New Storage type"
    end
  end

  describe "create storage_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/storage_types", storage_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/storage_types/#{id}"

      conn = get(conn, ~p"/storage_types/#{id}")
      assert html_response(conn, 200) =~ "Storage type #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/storage_types", storage_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Storage type"
    end
  end

  describe "edit storage_type" do
    setup [:create_storage_type]

    test "renders form for editing chosen storage_type", %{conn: conn, storage_type: storage_type} do
      conn = get(conn, ~p"/storage_types/#{storage_type}/edit")
      assert html_response(conn, 200) =~ "Edit Storage type"
    end
  end

  describe "update storage_type" do
    setup [:create_storage_type]

    test "redirects when data is valid", %{conn: conn, storage_type: storage_type} do
      conn = put(conn, ~p"/storage_types/#{storage_type}", storage_type: @update_attrs)
      assert redirected_to(conn) == ~p"/storage_types/#{storage_type}"

      conn = get(conn, ~p"/storage_types/#{storage_type}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, storage_type: storage_type} do
      conn = put(conn, ~p"/storage_types/#{storage_type}", storage_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Storage type"
    end
  end

  describe "delete storage_type" do
    setup [:create_storage_type]

    test "deletes chosen storage_type", %{conn: conn, storage_type: storage_type} do
      conn = delete(conn, ~p"/storage_types/#{storage_type}")
      assert redirected_to(conn) == ~p"/storage_types"

      assert_error_sent 404, fn ->
        get(conn, ~p"/storage_types/#{storage_type}")
      end
    end
  end

  defp create_storage_type(_) do
    storage_type = storage_type_fixture()
    %{storage_type: storage_type}
  end
end
