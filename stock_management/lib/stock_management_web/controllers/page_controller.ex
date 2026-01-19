defmodule StockManagementWeb.PageController do
  use StockManagementWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
