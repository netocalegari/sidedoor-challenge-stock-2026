defmodule StockManagement.Stock do
  @moduledoc """
  The Stock context.
  """

  import Ecto.Query, warn: false
  alias StockManagement.Inventory
  alias StockManagement.Repo

  alias StockManagement.Stock.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs) do
    Repo.transact(fn ->
      {:ok, product} =
        %Product{}
        |> Product.changeset(attrs)
        |> Repo.insert()

      if product.quantity > 0 do
        Inventory.create_movement(%{
          quantity: product.quantity,
          type: "entrada",
          product_id: product.id
        })
      end
    end)
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    Repo.transact(fn ->
      case product
           |> Product.changeset(attrs)
           |> Repo.update() do
        {:ok, updated_product} ->
          if product.quantity == updated_product.quantity do
            {:ok, updated_product}
          else
            type = (product.quantity < updated_product.quantity && "entrada") || "saida"

            Inventory.create_movement(%{
              quantity: abs(updated_product.quantity - product.quantity),
              type: type,
              product_id: product.id
            })

            {:ok, updated_product}
          end

        {:error, changeset} ->
          Repo.rollback(changeset)
      end
    end)
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end
end
