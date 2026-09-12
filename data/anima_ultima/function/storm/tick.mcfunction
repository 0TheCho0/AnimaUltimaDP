# Storm Tick Handler

# Decrement timer if storm is active
execute if score #storm_ticks au_data matches 1.. run scoreboard players remove #storm_ticks au_data 1

# Apply buffs to hostile mobs while storm is active (resistance 1, speed 1)
execute if score #storm_ticks au_data matches 1.. as @e[type=#anima_ultima:hostile_mobs] run effect give @s resistance 2 0 true
execute if score #storm_ticks au_data matches 1.. as @e[type=#anima_ultima:hostile_mobs] run effect give @s speed 2 0 true

# Maintain thunder weather even if players sleep in bed
execute if score #storm_ticks au_data matches 1.. run scoreboard players add #weather_sync au_data 1
execute if score #storm_ticks au_data matches 1.. if score #weather_sync au_data matches 20.. run function anima_ultima:storm/sync_weather

# Storm expired
execute if score #storm_ticks au_data matches 0 if score #storm_active au_data matches 1 run function anima_ultima:storm/stop
