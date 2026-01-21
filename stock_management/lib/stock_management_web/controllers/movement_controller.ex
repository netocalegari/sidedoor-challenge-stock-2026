defmodule StockManagementWeb.MovementController do
  use StockManagementWeb, :controller

  alias StockManagement.Inventory
  alias StockManagement.Inventory.Movement

  def index(conn, _params) do
    movements = Inventory.list_movements()
    render(conn, :index, movements: movements)
  end

  def create(conn, %{"movement" => movement_params}) do
    case Inventory.create_movement(movement_params) do
      {:ok, movement} ->
        conn
        |> put_flash(:info, "Movement created successfully.")
        |> redirect(to: ~p"/movements/#{movement}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    movement = Inventory.get_movement!(id)
    render(conn, :show, movement: movement)
  end
end
