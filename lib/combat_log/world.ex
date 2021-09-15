defmodule CombatLog.World do
  @moduledoc """
  The general world state, tracking which entity is at what location

  Persisted on change:
  Player stats
  Player inventory

  Persisted periodically:
  Player location

  Generated on boot:
  NPC locations and stats
  Vendor inventories
  """

  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(_args) do
    {:ok, %{}}
  end
end
