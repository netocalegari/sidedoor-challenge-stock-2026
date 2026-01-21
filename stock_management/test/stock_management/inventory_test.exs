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

  describe "movements" do
    alias StockManagement.Inventory.Movement

    import StockManagement.InventoryFixtures

    test "list_movements/0 returns all movements" do
      movement = movement_fixture()
      assert Inventory.list_movements() == [movement]
    end

    test "get_movement!/1 returns the movement with given id" do
      movement = movement_fixture()
      assert Inventory.get_movement!(movement.id) == movement
    end

    test "create_movement/1 with valid data creates a movement" do
      assert {:ok, %Movement{} = movement} = Inventory.create_movement(valid_attrs)
      assert movement.dummy == "some dummy"
    end

    test "create_movement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_movement(@invalid_attrs)
    end

    test "update_movement/2 with valid data updates the movement" do
      movement = movement_fixture()
      update_attrs = %{dummy: "some updated dummy"}

      assert {:ok, %Movement{} = movement} = Inventory.update_movement(movement, update_attrs)
      assert movement.dummy == "some updated dummy"
    end

    test "update_movement/2 with invalid data returns error changeset" do
      movement = movement_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_movement(movement, @invalid_attrs)
      assert movement == Inventory.get_movement!(movement.id)
    end

    test "delete_movement/1 deletes the movement" do
      movement = movement_fixture()
      assert {:ok, %Movement{}} = Inventory.delete_movement(movement)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_movement!(movement.id) end
    end

    test "change_movement/1 returns a movement changeset" do
      movement = movement_fixture()
      assert %Ecto.Changeset{} = Inventory.change_movement(movement)
    end
  end
end
