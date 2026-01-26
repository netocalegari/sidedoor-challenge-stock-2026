defmodule StockManagementWeb.Api.FallbackController do
  use StockManagementWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(StockManagementWeb.Api.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, :missing_product_id}) do
    conn
    |> put_status(:bad_request)
    |> put_view(StockManagementWeb.ErrorJSON)
    |> render(:"400")
  end

  def call(conn, {:error, :insufficient_stock}) do
    conn
    |> put_status(:bad_request)
    |> put_view(StockManagementWeb.ErrorJSON)
    |> render(:"400")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(StockManagementWeb.ErrorJSON)
    |> render(:"404")
  end
end
