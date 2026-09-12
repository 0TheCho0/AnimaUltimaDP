# Storm trigger when a player dies on Day 3+

# Save state BEFORE execution to prevent race condition
scoreboard players operation #was_storm_active au_data = #storm_active au_data

# Execute appropriate handler
execute if score #was_storm_active au_data matches 0 run function anima_ultima:storm/start_new
execute if score #was_storm_active au_data matches 1.. run function anima_ultima:storm/extend_existing
