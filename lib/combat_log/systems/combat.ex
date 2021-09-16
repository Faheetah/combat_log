defmodule CombatLog.Systems.Combat do
  alias CombatLog.Entity
  alias CombatLog.Components.HealthComponent
  alias CombatLog.Systems.Combat.{HealthSystem,DamageSystem}

  def attack(source, target) do
    source_entity = Entity.get(source)
    target_entity = Entity.get(target)
    {type, damage} = DamageSystem.melee(source_entity, target_entity)
    result = HealthSystem.damage(target_entity, damage)
    health = result.components[HealthComponent]
    if health.alive do
      case type do
        :miss ->
          IO.puts "#{source_entity.name} missed #{target_entity.name}"

        :hit ->
          IO.puts "#{source_entity.name} hit #{target_entity.name} for #{damage} damage (#{health.health}hp left)"
          Entity.update(target, HealthSystem.damage(target_entity, damage))

        :crit ->
          IO.puts "#{source_entity.name} critical hit #{target_entity.name} for #{damage} damage (#{health.health}hp left)"
          Entity.update(target, HealthSystem.damage(target_entity, damage))

        :crush ->
          IO.puts "#{source_entity.name} crushing blow #{target_entity.name} for #{damage} damage (#{health.health}hp left)"
          Entity.update(target, HealthSystem.damage(target_entity, damage))
      end
    else
      IO.puts "#{source_entity.name} hit #{target_entity.name} for #{damage} damage (fatal blow)"
      :dead
    end
  end
end
