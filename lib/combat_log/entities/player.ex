defmodule CombatLog.Entities.Player do
  alias CombatLog.Entity

  def spawn(stats) do
    %Entity{}
    |> Entity.add_component(CombatLog.Components.Stats, stats)
    |> Entity.add_component(CombatLog.Components.Health, 0)
    |> CombatLog.Systems.Combat.Health.heal(:full)
    |> Entity.spawn()
  end
end
