defmodule CombatLog.Systems.Combat.Damage do
  alias CombatLog.Entity
  alias CombatLog.Components.Stats

  def melee(source, target) do
    source.strength
  end
end
