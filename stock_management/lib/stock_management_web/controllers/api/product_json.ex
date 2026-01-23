defmodule StockManagementWeb.Api.ProductJSON do
  alias StockManagement.Stock.Product

  @doc """
  Renders a list of products.
  """
  def index(%{products: products}) do
    %{data: Enum.map(products, &product_json/1)}
  end

  def show(%{product: product}) do
    %{data: product_json(product)}
  end

  defp product_json(%Product{} = product) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      quantity: product.quantity
    }
  end
end
