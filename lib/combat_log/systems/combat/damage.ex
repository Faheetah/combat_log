defmodule CombatLog.Systems.Combat.DamageSystem do
  alias CombatLog.Components.StatComponent

  def melee(source, target) do
    source_stats = source.components[StatComponent]
    target_stats = target.components[StatComponent]

    source_hit = :rand.uniform(source_stats.dexterity + source_stats.level)
    target_dodge = :rand.uniform(target_stats.agility + target_stats.level + 1)

    cond do
      source_hit > target_dodge * 3 ->
        {:crush, floor(source_stats.strength * 1.5) + 1}

      source_hit > target_dodge * 2 ->
        {:crit, floor(source_stats.strength / 1.5) + 1}

      source_hit > target_dodge ->
        {:hit, floor(source_stats.strength / 2) + 1}

      true ->
        {:miss, 0}
    end
  end
end
