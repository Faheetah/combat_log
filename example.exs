IO.puts "CombatLog version #{Mix.Project.config[:version]}"
stats = %{
  strength: IO.gets("Strength: ") |> Integer.parse |> then(fn {n,_} -> n end),
  dexterity: IO.gets("Dexterity: ") |> Integer.parse |> then(fn {n,_} -> n end)
}

{:ok, player} = CombatLog.Systems.Player.new_player("Steve", stats)

zombie_level = IO.gets("What level would you like your zombie? ") |> Integer.parse |> then(fn {n,_} -> n end)
{:ok, zombie} = CombatLog.Entities.Zombie.spawn(zombie_level)

CombatLog.Systems.Player.attack(player, zombie)

skeleton_level = IO.gets("What level would you like your skeleton? ") |> Integer.parse |> then(fn {n,_} -> n end)
{:ok, skeleton} = CombatLog.Entities.Skeleton.spawn(skeleton_level)

CombatLog.Systems.Player.attack(player, skeleton)

IO.puts "Game over\n"
