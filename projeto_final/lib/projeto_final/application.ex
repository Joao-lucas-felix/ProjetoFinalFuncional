defmodule ProjetoFinal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ProjetoFinalWeb.Telemetry,
      ProjetoFinal.Repo,
      {DNSCluster, query: Application.get_env(:projeto_final, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ProjetoFinal.PubSub},
      # Start a worker by calling: ProjetoFinal.Worker.start_link(arg)
      # {ProjetoFinal.Worker, arg},
      # Start to serve requests, typically the last entry
      ProjetoFinalWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ProjetoFinal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProjetoFinalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
