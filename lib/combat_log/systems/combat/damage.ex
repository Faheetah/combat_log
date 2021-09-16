defmodule CombatLog.Systems.Combat.DamageSystem do
  def melee(source, _target) do
    source.strength
  end
end
