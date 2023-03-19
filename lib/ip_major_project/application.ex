defmodule IpMajorProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      IpMajorProjectWeb.Telemetry,
      # Start the Ecto repository
      IpMajorProject.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: IpMajorProject.PubSub},
      # Start Finch
      {Finch, name: IpMajorProject.Finch},
      # Start the Endpoint (http/https)
      IpMajorProjectWeb.Endpoint
      # Start a worker by calling: IpMajorProject.Worker.start_link(arg)
      # {IpMajorProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IpMajorProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IpMajorProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
