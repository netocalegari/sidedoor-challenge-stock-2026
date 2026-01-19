defmodule StockManagement.StockFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StockManagement.Stock` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: "120.5",
        quantity: 42
      })
      |> StockManagement.Stock.create_product()

    product
  end
end
