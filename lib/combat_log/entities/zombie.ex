defmodule CombatLog.Entities.Zombie do
  alias CombatLog.Entity
  alias CombatLog.Components.{StatComponent,HealthComponent}
  alias CombatLog.Systems.Combat.HealthSystem

  def spawn(level \\ 1) do
    stamina = Enum.random(1..3) + level
    {agility, ext} =
      if :rand.uniform(ceil(1000 / level)) == 1 do
        {level, " (MJ)"}
      else
        {1, ""}
      end

    %Entity{name: "zombie#{ext}"}
    |> Entity.add_component(StatComponent, %{level: level, agility: agility, stamina: stamina, strength: Enum.random(1..3)})
    |> Entity.add_component(HealthComponent, %{health: 0})
    |> HealthSystem.heal(:full)
    |> Entity.spawn()
  end
end
