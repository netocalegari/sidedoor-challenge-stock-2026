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

  def create(conn, product_params) do
    case StockManagement.Stock.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_status(:created)
        |> render(:show, product: product)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(StockManagementWeb.Api.ChangesetView)
        |> render("error.json", changeset: changeset)
    end
  end
end
