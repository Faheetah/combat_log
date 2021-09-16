defmodule CombatLog.Systems.Player do
  alias CombatLog.Systems.Combat

  def new_player(name) do
    stats = %{
      strength: :rand.uniform(10),
      stamina: :rand.uniform(10),
      dexterity: :rand.uniform(10),
      agility: :rand.uniform(10),
      intellect: :rand.uniform(10),
      wisdom: :rand.uniform(10),
      charisma: :rand.uniform(10)
    }

    stat_names =
      stats
      |> Enum.map(fn {stat, val} -> "#{stat}: #{val}" end)
      |> Enum.join("\n")

    IO.puts "Generated #{name} with stats:\n#{stat_names}\n"

    CombatLog.Entities.Player.spawn(name, stats)
  end

  def attack(player, target) do
    case Combat.attack(player, target) do
      :dead ->
        nil
      _ ->
        attack(player, target)
    end
  end
end
