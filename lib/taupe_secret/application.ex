defmodule TaupeSecret.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TaupeSecretWeb.Telemetry,
      # Start the Ecto repository
      TaupeSecret.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TaupeSecret.PubSub},
      # Start Finch
      {Finch, name: TaupeSecret.Finch},
      # Start the Endpoint (http/https)
      TaupeSecretWeb.Endpoint
      # Start a worker by calling: TaupeSecret.Worker.start_link(arg)
      # {TaupeSecret.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TaupeSecret.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TaupeSecretWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
