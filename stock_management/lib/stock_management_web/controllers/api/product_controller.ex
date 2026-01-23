defmodule StockManagementWeb.Api.ProductController do
  use StockManagementWeb, :controller

  def index(conn, _params) do
    products = StockManagement.Stock.list_products()
    render(conn, :index, products: products)
  end

  def show(conn, %{"id" => id}) do
    product = StockManagement.Stock.get_product!(id)
    render(conn, :show, product: product)
  end
end
