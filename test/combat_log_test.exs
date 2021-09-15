defmodule CombatLogTest do
  use ExUnit.Case
  doctest CombatLog

  test "greets the world" do
    assert CombatLog.hello() == :world
  end
end
