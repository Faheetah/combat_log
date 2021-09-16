defmodule CombatLog.Systems.Player do
  alias CombatLog.Systems.Combat

  def roll(name) do
    stats = %{
      strength: :rand.uniform(10),
      stamina: :rand.uniform(10),
      dexterity: :rand.uniform(10),
      agility: :rand.uniform(10),
      intellect: :rand.uniform(10),
      wisdom: :rand.uniform(10),
      charisma: :rand.uniform(10)
    }
    new_player(name, stats)
  end

  def new_player(name, stats) do
    {:ok, player} = CombatLog.Entities.Player.spawn(name, stats)

    stat_names =
      CombatLog.Entity.get(player)
      |> Map.get(:components)
      |> Map.get(CombatLog.Components.StatComponent)
      |> Map.to_list()
      |> Keyword.delete(:__struct__)
      |> Enum.map(fn {stat, val} -> "#{stat}: #{val}" end)
      |> Enum.join("\n")

    IO.puts "Generated #{name} with stats:\n#{stat_names}\n"

    {:ok, player}
  end

  def attack(player, target, turns \\ 1) do
    unless Combat.attack(player, target) == :dead do
      attack(player, target, turns + 1)
    else
      IO.puts "Dead in #{turns} turns"
    end
  end
end
