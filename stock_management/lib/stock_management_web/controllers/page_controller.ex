defmodule StockManagementWeb.PageController do
  use StockManagementWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/products")
  end
end
