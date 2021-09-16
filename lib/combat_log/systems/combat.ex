defmodule CombatLog.Systems.Combat do
  alias CombatLog.Entity
  alias CombatLog.Components
  alias CombatLog.Systems.Combat.{Health,Damage}

  def attack(source, target) do
    source_entity = Entity.get(source)
    source_stats = Entity.get_component(source_entity, Components.Stats)
    target_entity = Entity.get(target)
    target_stats = Entity.get_component(target_entity, Components.Stats)
    target_health = Entity.get_component(target_entity, Components.Health)
    damage = Damage.melee(source_stats, target_stats)
    if target_health.alive do
      IO.puts "#{source_entity.name} damages #{target_entity.name} for #{damage} (#{target_health.health}hp left)"
      Entity.update(target, Health.damage(target_entity, damage))
    else
      IO.puts "target #{target_entity.name} is dead"
      :dead
    end
  end
end
