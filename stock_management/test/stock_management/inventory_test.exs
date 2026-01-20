defmodule StockManagement.InventoryTest do
  use StockManagement.DataCase

  alias StockManagement.Inventory

  describe "movements" do
    alias StockManagement.Inventory.Movements

    import StockManagement.InventoryFixtures

    @invalid_attrs %{}

    test "list_movements/0 returns all movements" do
      movements = movements_fixture()
      assert Inventory.list_movements() == [movements]
    end

    test "get_movements!/1 returns the movements with given id" do
      movements = movements_fixture()
      assert Inventory.get_movements!(movements.id) == movements
    end

    test "create_movements/1 with valid data creates a movements" do
      valid_attrs = %{}

      assert {:ok, %Movements{} = movements} = Inventory.create_movements(valid_attrs)
    end

    test "create_movements/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_movements(@invalid_attrs)
    end

    test "update_movements/2 with valid data updates the movements" do
      movements = movements_fixture()
      update_attrs = %{}

      assert {:ok, %Movements{} = movements} = Inventory.update_movements(movements, update_attrs)
    end

    test "update_movements/2 with invalid data returns error changeset" do
      movements = movements_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_movements(movements, @invalid_attrs)
      assert movements == Inventory.get_movements!(movements.id)
    end

    test "delete_movements/1 deletes the movements" do
      movements = movements_fixture()
      assert {:ok, %Movements{}} = Inventory.delete_movements(movements)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_movements!(movements.id) end
    end

    test "change_movements/1 returns a movements changeset" do
      movements = movements_fixture()
      assert %Ecto.Changeset{} = Inventory.change_movements(movements)
    end
  end
end
