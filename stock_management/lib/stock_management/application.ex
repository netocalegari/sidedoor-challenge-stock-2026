defmodule StockManagement.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StockManagementWeb.Telemetry,
      StockManagement.Repo,
      {DNSCluster, query: Application.get_env(:stock_management, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StockManagement.PubSub},
      # Start a worker by calling: StockManagement.Worker.start_link(arg)
      # {StockManagement.Worker, arg},
      # Start to serve requests, typically the last entry
      StockManagementWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StockManagement.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StockManagementWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
