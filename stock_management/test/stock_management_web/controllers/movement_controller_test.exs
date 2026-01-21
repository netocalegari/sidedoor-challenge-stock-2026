defmodule StockManagementWeb.MovementControllerTest do
  use StockManagementWeb.ConnCase

  import StockManagement.InventoryFixtures

  @create_attrs %{dummy: "some dummy"}
  @update_attrs %{dummy: "some updated dummy"}
  @invalid_attrs %{dummy: nil}

  describe "index" do
    test "lists all movements", %{conn: conn} do
      conn = get(conn, ~p"/movements")
      assert html_response(conn, 200) =~ "Listing Movements"
    end
  end

  describe "new movement" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/movements/new")
      assert html_response(conn, 200) =~ "New Movement"
    end
  end

  describe "create movement" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/movements", movement: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/movements/#{id}"

      conn = get(conn, ~p"/movements/#{id}")
      assert html_response(conn, 200) =~ "Movement #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/movements", movement: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Movement"
    end
  end

  describe "edit movement" do
    setup [:create_movement]

    test "renders form for editing chosen movement", %{conn: conn, movement: movement} do
      conn = get(conn, ~p"/movements/#{movement}/edit")
      assert html_response(conn, 200) =~ "Edit Movement"
    end
  end

  describe "update movement" do
    setup [:create_movement]

    test "redirects when data is valid", %{conn: conn, movement: movement} do
      conn = put(conn, ~p"/movements/#{movement}", movement: @update_attrs)
      assert redirected_to(conn) == ~p"/movements/#{movement}"

      conn = get(conn, ~p"/movements/#{movement}")
      assert html_response(conn, 200) =~ "some updated dummy"
    end

    test "renders errors when data is invalid", %{conn: conn, movement: movement} do
      conn = put(conn, ~p"/movements/#{movement}", movement: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Movement"
    end
  end

  describe "delete movement" do
    setup [:create_movement]

    test "deletes chosen movement", %{conn: conn, movement: movement} do
      conn = delete(conn, ~p"/movements/#{movement}")
      assert redirected_to(conn) == ~p"/movements"

      assert_error_sent 404, fn ->
        get(conn, ~p"/movements/#{movement}")
      end
    end
  end

  defp create_movement(_) do
    movement = movement_fixture()

    %{movement: movement}
  end
end
