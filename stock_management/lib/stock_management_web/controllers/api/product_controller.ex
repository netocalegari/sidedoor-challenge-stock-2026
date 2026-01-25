defmodule StockManagementWeb.Api.ProductController do
  use StockManagementWeb, :controller

  action_fallback StockManagementWeb.Api.FallbackController

  def index(conn, _params) do
    products = StockManagement.Stock.list_products()
    render(conn, :index, products: products)
  end

  def show(conn, %{"id" => id}) do
    product = StockManagement.Stock.get_product!(id)
    render(conn, :show, product: product)
  end

  def create(conn, product_params) do
    with {:ok, product} <- StockManagement.Stock.create_product(product_params) do
      conn
      |> put_status(:created)
      |> render(:show, product: product)
    end
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = StockManagement.Stock.get_product!(id)

    with {:ok, product} <- StockManagement.Stock.update_product(product, product_params) do
      conn
      |> put_status(:ok)
      |> render(:show, product: product)
    end
  end
end
