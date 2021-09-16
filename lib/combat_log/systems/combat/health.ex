defmodule CombatLog.Systems.Combat.HealthSystem do
  alias CombatLog.Entity
  alias CombatLog.Components.{HealthComponent,StatComponent}

  def calculate_health(stamina), do: stamina * 10

  def max_health(entity) do
    stats = Entity.get_component(entity, StatComponent)
    calculate_health(stats.stamina)
  end

  def heal(entity, :full) do
    case Entity.get_component(entity, StatComponent) do
      nil -> nil
      stats -> update_health(entity, calculate_health(stats.stamina))
    end
  end

  def heal(entity, amount) do
    case Entity.get_component(entity, HealthComponent) do
      nil -> nil
      health -> update_health(entity, min(max_health(entity), health + amount))
    end
  end

  def damage(entity, amount) do
    case Entity.get_component(entity, HealthComponent) do
      nil -> nil
      %{health: health} -> update_health(entity, max(0, health - amount))
    end
  end

  def kill(entity) do
    case Entity.get_component(entity, HealthComponent) do
      nil -> nil
      _ -> update_health(entity, 0)
    end
  end

  def update_health(entity, value) do
    case Entity.get_component(entity, HealthComponent) do
      nil -> nil
      %{alive: false} -> entity
      _ -> Entity.update_component(entity, HealthComponent, %HealthComponent{health: value, alive: value > 0})
    end
  end
end
