defmodule CombatLog.Systems.Combat.Health do
  alias CombatLog.Entity
  alias CombatLog.Components.{Health,Stats}

  def calculate_health(stamina), do: stamina * 10

  def max_health(entity) do
    stats = Entity.get_component(entity, Stats)
    calculate_health(stats.stamina)
  end

  def heal(entity, :full) do
    case Entity.get_component(entity, Stats) do
      nil -> nil
      stats -> Entity.update_component(entity, Health, calculate_health(stats.stamina))
    end
  end

  def heal(entity, amount) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      health -> Entity.update_component(entity, Health, %Health{health: min(max_health(entity), health + amount)})
    end
  end

  def damage(entity, amount) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      health -> Entity.update_component(entity, Health, %Health{health: max(0, health - amount)})
    end
  end

  def kill(entity) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      _ -> Entity.update_component(entity, Health, %Health{health: 0})
    end
  end
end
