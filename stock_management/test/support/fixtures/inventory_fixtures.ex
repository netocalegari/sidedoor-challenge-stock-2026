defmodule StockManagement.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StockManagement.Inventory` context.
  """

  @doc """
  Generate a movements.
  """
  def movements_fixture(attrs \\ %{}) do
    {:ok, movements} =
      attrs
      |> Enum.into(%{

      })
      |> StockManagement.Inventory.create_movements()

    movements
  end

  @doc """
  Generate a movement.
  """
  def movement_fixture(attrs \\ %{}) do
    {:ok, movement} =
      attrs
      |> Enum.into(%{
        dummy: "some dummy"
      })
      |> StockManagement.Inventory.create_movement()

    movement
  end
end
