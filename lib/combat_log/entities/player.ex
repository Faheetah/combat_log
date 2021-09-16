defmodule CombatLog.Entities.Player do
  alias CombatLog.Entity
  alias CombatLog.Components.{StatComponent,HealthComponent}
  alias CombatLog.Systems.Combat.HealthSystem

  def spawn(name, stats) do
    %Entity{name: name}
    |> Entity.add_component(StatComponent, stats)
    |> Entity.add_component(HealthComponent, %{})
    |> HealthSystem.heal(:full)
    |> Entity.spawn()
  end
end
