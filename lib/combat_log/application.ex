defmodule CombatLog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CombatLog.Entity.Supervisor
    ]

    opts = [strategy: :one_for_one, name: CombatLog.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
