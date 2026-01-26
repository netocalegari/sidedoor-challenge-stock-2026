defmodule StockManagement.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias StockManagement.Stock
  alias StockManagement.Repo

  alias StockManagement.Inventory.Movement

  @doc """
  Returns the list of movements.

  ## Examples

      iex> list_movements()
      [%Movements{}, ...]

  """
  def list_movements do
    Movement
    |> order_by([m], desc: m.inserted_at)
    |> Repo.all()
  end

  @doc """
  Gets a single movements.

  Raises if the Movements does not exist.

  ## Examples

      iex> get_movements!(123)
      %Movements{}

  """
  def get_movement!(id), do: Movement |> Repo.get!(id)

  def get_movement(id) do
    case Repo.get(Movement, id) do
      nil -> {:error, :not_found}
      movement -> {:ok, movement}
    end
  end

  @doc """
  Creates a movements.

  ## Examples

      iex> create_movements(%{field: value})
      {:ok, %Movements{}}

      iex> create_movements(%{field: bad_value})
      {:error, ...}

  """
  def create_movement(attrs) do
    Repo.transaction(fn ->
      changeset = Movement.changeset(%Movement{}, attrs)

      if changeset.valid? == false do
        Repo.rollback(Map.put(changeset, :action, :insert))
      end

      movement = Ecto.Changeset.apply_changes(changeset)

      product =
        case Stock.get_product!(movement.product_id) do
          nil ->
            Repo.rollback(:product_not_found)

          product ->
            product
        end

      qty = movement.quantity
      type = movement.type

      cond do
        qty <= 0 ->
          Repo.rollback(
            Ecto.Changeset.add_error(changeset, :quantity, "Quantidade deve ser maior que zero")
            |> Map.put(:action, :insert)
          )

        type == :saida and qty > product.quantity ->
          new_cs = Ecto.Changeset.add_error(changeset, :quantity, "Estoque insuficiente")

          Repo.rollback(Map.put(new_cs, :action, :insert))

        true ->
          new_quantity =
            case type do
              :entrada ->
                product.quantity + qty

              :saida ->
                product.quantity - qty

              _ ->
                Repo.rollback(Map.put(changeset, :action, :insert))
            end

          {:ok, _product} =
            Stock.update_product(product, %{quantity: new_quantity})

          Repo.insert!(changeset)
      end
    end)
  end

  def change_movement(%Movement{} = movement, attrs \\ %{}) do
    Movement.changeset(movement, attrs)
  end
end
