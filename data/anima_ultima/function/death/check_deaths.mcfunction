# Check for any player who died
execute as @a[scores={au_deaths=1..}] at @s run function anima_ultima:death/on_death

# Ensure permaban/spectator state for deceased players
execute as @a[tag=au_dead,gamemode=!spectator] run gamemode spectator @s
