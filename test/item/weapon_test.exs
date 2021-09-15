defmodule CombatLog.Item.WeaponTest do
  use ExUnit.Case

  alias CombatLog.Item.Weapon

  # not a very useful test, but establishes a base for weapon functionality
  test "calculates weapon damage" do
    damage = Weapon.calculate_damage(%Weapon{min: 1, max: 4})
    assert damage >= 1
    assert damage <= 4
  end

  test "displays the weapon damage" do
    label = Weapon.display(%Weapon{min: 1, max: 4})
    assert label == "1d4"
  end
end
