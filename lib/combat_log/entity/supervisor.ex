defmodule CombatLog.Entity.Supervisor do
  @moduledoc false

  use DynamicSupervisor

  def start_link(_args) do
    DynamicSupervisor.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    {:ok, %{}}
  end
end
