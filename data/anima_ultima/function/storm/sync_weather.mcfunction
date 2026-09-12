# Sync weather periodically while storm is active
scoreboard players set #weather_sync au_data 0

# Force weather to thunder if storm timer is still running
execute if score #storm_ticks au_data matches 1.. run weather thunder 1000000

