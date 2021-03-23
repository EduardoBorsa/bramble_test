defmodule BrambleEngineering.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BrambleEngineering.Repo,
      # Start the Telemetry supervisor
      BrambleEngineeringWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BrambleEngineering.PubSub},
      # Start the Endpoint (http/https)
      BrambleEngineeringWeb.Endpoint
      # Start a worker by calling: BrambleEngineering.Worker.start_link(arg)
      # {BrambleEngineering.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BrambleEngineering.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BrambleEngineeringWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
