defmodule Rinha.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RinhaWeb.Telemetry,
      # Start the Ecto repository
      Rinha.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rinha.PubSub},
      # Start the Endpoint (http/https)
      RinhaWeb.Endpoint
      # Start a worker by calling: Rinha.Worker.start_link(arg)
      # {Rinha.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rinha.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RinhaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
