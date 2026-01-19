defmodule StockManagement.Repo do
  use Ecto.Repo,
    otp_app: :stock_management,
    adapter: Ecto.Adapters.Postgres
end
