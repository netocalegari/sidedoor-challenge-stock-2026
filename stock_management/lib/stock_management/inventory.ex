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
    raise "TODO"
  end

  @doc """
  Gets a single movements.

  Raises if the Movements does not exist.

  ## Examples

      iex> get_movements!(123)
      %Movements{}

  """
  def get_movement!(id), do: raise "TODO"

  @doc """
  Creates a movements.

  ## Examples

      iex> create_movements(%{field: value})
      {:ok, %Movements{}}

      iex> create_movements(%{field: bad_value})
      {:error, ...}

  """
  def create_movement(attrs) do
    raise "TODO"
  end

  @doc """
  Updates a movements.

  ## Examples

      iex> update_movements(movements, %{field: new_value})
      {:ok, %Movements{}}

      iex> update_movements(movements, %{field: bad_value})
      {:error, ...}

  """
  def update_movement(%Movement{} = movements, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Movements.

  ## Examples

      iex> delete_movements(movements)
      {:ok, %Movements{}}

      iex> delete_movements(movements)
      {:error, ...}

  """
  def delete_movement(%Movement{} = movements) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking movements changes.

  ## Examples

      iex> change_movements(movements)
      %Todo{...}

  """
  def change_movement(%Movement{} = movements, _attrs \\ %{}) do
    raise "TODO"
  end
end
