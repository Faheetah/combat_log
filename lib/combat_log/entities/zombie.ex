defmodule CombatLog.Entities.Zombie do
  alias CombatLog.Entity
  alias CombatLog.Components.{Stats,Health}

  def spawn(_) do
    %Entity{name: "zombie"}
    |> Entity.add_component(Stats, %Stats{stamina: Enum.random(1..3), strength: Enum.random(1..3)})
    |> Entity.add_component(Health, %Health{health: 0})
    |> CombatLog.Systems.Combat.Health.heal(:full)
    |> Entity.spawn()
  end
end
