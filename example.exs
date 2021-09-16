{:ok, player} = CombatLog.Systems.Player.new_player("Steve")
{:ok, zombie} = CombatLog.Entities.Zombie.spawn(%{})
{:ok, skeleton} = CombatLog.Entities.Skeleton.spawn(%{})

CombatLog.Systems.Player.attack(player, zombie)

CombatLog.Systems.Player.attack(player, skeleton)
