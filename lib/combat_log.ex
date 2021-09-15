defmodule CombatLog do
  @moduledoc false

  def registry(component) do
    Registry.lookup(CombatLog.EntityRegistry, component)
  end

  def player() do
    CombatLog.Entities.Player.spawn(%{
      strength: :rand.uniform(10),
      stamina: :rand.uniform(10),
      dexterity: :rand.uniform(10),
      agility: :rand.uniform(10),
      intellect: :rand.uniform(10),
      wisdom: :rand.uniform(10),
      charisma: :rand.uniform(10)
    })
  end

  def zombie() do
    CombatLog.Entities.Zombie.spawn(%{
      strength: 1,
      stamina: 2
    })
  end

  def attack(player, npc) do
    CombatLog.Systems.Combat.attack(player, npc)
  end
end
