defmodule CombatLog.Item.Weapon do
  @moduledoc """
  Describes the stats of a weapon
  """

  defstruct [
    :min,
    :max,
  ]

  @doc "calculate the damage of a weapon action using random damage"
  def calculate_damage(%__MODULE__{min: min, max: max}) do
    Enum.random(min..max)
  end

  @doc "generates a display label for the weapon using XdY format"
  def display(%__MODULE__{min: min, max: max}) do
    "#{min}d#{max}"
  end
end
