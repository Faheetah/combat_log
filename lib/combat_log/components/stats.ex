defmodule CombatLog.Components.Stats do
  # this module should be split up into more granular components

  defstruct [
    # innate stats
    ## melee
    strength: 1,
    stamina: 1,
    ## range
    dexterity: 1,
    agility: 1,
    ## magic
    intellect: 1,
    wisdom: 1,
    ## trade
    charisma: 1,
    # changing stats
    level: 1
  ]
end
