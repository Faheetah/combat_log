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
      stats -> update_health(entity, calculate_health(stats.stamina))
    end
  end

  def heal(entity, amount) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      health -> update_health(entity, min(max_health(entity), health + amount))
    end
  end

  def damage(entity, amount) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      %{health: health} -> update_health(entity, max(0, health - amount))
    end
  end

  def kill(entity) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      _ -> update_health(entity, 0)
    end
  end

  def update_health(entity, value) do
    case Entity.get_component(entity, Health) do
      nil -> nil
      %{alive: false} -> entity
      _ -> Entity.update_component(entity, Health, %Health{health: value, alive: value > 0})
    end
  end
end
