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
end
