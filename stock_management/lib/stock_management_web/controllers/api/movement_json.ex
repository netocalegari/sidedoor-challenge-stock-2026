defmodule StockManagementWeb.Api.MovementJSON do
  alias StockManagement.Inventory.Movement

  @doc """
  Renders a list of movements.
  """
  def index(%{movements: movements}) do
    %{data: Enum.map(movements, &movement_json/1)}
  end

  def show(%{movement: movement}) do
    %{data: movement_json(movement)}
  end

  defp movement_json(%Movement{} = movement) do
    %{
      id: movement.id,
      product_id: movement.product_id,
      quantity: movement.quantity,
      type: movement.type,
      inserted_at: movement.inserted_at,
      updated_at: movement.updated_at
    }
  end
end
