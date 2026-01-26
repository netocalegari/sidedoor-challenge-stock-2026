defmodule StockManagementWeb.Api.MovementController do
  alias StockManagement.Inventory
  use StockManagementWeb, :controller

  action_fallback StockManagementWeb.Api.FallbackController

  def index(conn, _params) do
    movements = Inventory.list_movements()
    render(conn, :index, movements: movements)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, movement} <- Inventory.get_movement(id) do
      render(conn, :show, movement: movement)
    end
  end

  def create(conn, movement_params) do
    IO.puts("Movement params: #{inspect(movement_params)}")

    with {:ok, movement} <- Inventory.create_movement(movement_params) do
      conn
      |> put_status(:created)
      |> render(:show, movement: movement)
    end
  end
end
