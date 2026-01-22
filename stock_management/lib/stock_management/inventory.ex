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

      if attrs["product_id"] == "" do
        Repo.rollback(Map.put(changeset, :action, :insert))
      end

      product = Stock.get_product!(attrs["product_id"])

      qty =
        case attrs["quantity"] do
          "" -> 0
          nil -> 0
          q -> String.to_integer(q)
        end

      cond do
        qty <= 0 ->
          Repo.rollback(Map.put(changeset, :action, :insert))

        attrs["type"] == "saida" and qty > product.quantity ->
          new_cs = Ecto.Changeset.add_error(changeset, :quantity, "Estoque insuficiente")

          Repo.rollback(Map.put(new_cs, :action, :insert))

        true ->
          case attrs["type"] do
            "entrada" ->
              Stock.update_product(product, %{quantity: product.quantity + qty})

            "saida" ->
              Stock.update_product(product, %{quantity: product.quantity - qty})

            _ ->
              Repo.rollback(Map.put(changeset, :action, :insert))
          end

          %Movement{}
          |> Movement.changeset(attrs)
          |> Repo.insert!()
      end
    end)
  end

  def change_movement(%Movement{} = movement, attrs \\ %{}) do
    Movement.changeset(movement, attrs)
  end
end
