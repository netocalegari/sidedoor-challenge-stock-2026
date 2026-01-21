defmodule StockManagement.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
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
    %Movement{}
    |> Movement.changeset(attrs)
    |> Repo.insert()
  end

  def change_movement(%Movement{} = movement, attrs \\ %{}) do
    Movement.changeset(movement, attrs)
  end
end
