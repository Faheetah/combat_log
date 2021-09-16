defmodule CombatLog do
  @moduledoc """
  Helper functions for testing game state
  """

  def registry(component) do
    Registry.lookup(CombatLog.EntityRegistry, component)
  end

  def player(name) do
    CombatLog.Entities.Player.spawn(name, %{
      strength: :rand.uniform(10),
      stamina: :rand.uniform(10),
      dexterity: :rand.uniform(10),
      agility: :rand.uniform(10),
      intellect: :rand.uniform(10),
      wisdom: :rand.uniform(10),
      charisma: :rand.uniform(10)
    })
    |> then(fn {:ok, entity} -> entity end)
  end

  def zombie() do
    CombatLog.Entities.Zombie.spawn(%{
      strength: 1,
      stamina: 2
    })
    |> then(fn {:ok, entity} -> entity end)
  end

  def attack(player, npc) do
    CombatLog.Systems.Combat.attack(player, npc)
  end

  def get(entity) do
    CombatLog.Entity.get(entity)
  end

  def sim() do
    player = player("Steve")
    zombie = zombie()

    attack_until_dead(player, zombie)
  end

  def attack_until_dead(source, target) do
    case attack(source, target) do
      :dead ->
        nil
      _ ->
        attack(source, target)
        attack_until_dead(source, target)
    end
  end
end
