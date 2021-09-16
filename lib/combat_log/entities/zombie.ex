defmodule CombatLog.Entities.Zombie do
  alias CombatLog.Entity
  alias CombatLog.Components.{StatComponent,HealthComponent}
  alias CombatLog.Systems.Combat.HealthSystem

  def spawn(_) do
    %Entity{name: "zombie"}
    |> Entity.add_component(StatComponent, %StatComponent{stamina: Enum.random(1..3), strength: Enum.random(1..3)})
    |> Entity.add_component(HealthComponent, %HealthComponent{health: 0})
    |> HealthSystem.heal(:full)
    |> Entity.spawn()
  end
end
