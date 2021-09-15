defmodule CombatLog.Systems.Combat do
  alias CombatLog.Entity
  alias CombatLog.Components

  def attack(source, target) do
    source_stats = Entity.get_component(source, Components.Stats)
    target_stats = Entity.get_component(target, Components.Stats)
  end
end
