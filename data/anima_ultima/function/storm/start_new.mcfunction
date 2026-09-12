# Start a new storm
scoreboard players set #storm_active au_data 1

# Base 10 minutes = 12000 ticks
scoreboard players set #storm_ticks au_data 12000

# +1 min per dead player (1200 ticks per total_deaths)
scoreboard players operation #death_ticks au_data = #total_deaths au_data
scoreboard players set #const_1200 au_data 1200
scoreboard players operation #death_ticks au_data *= #const_1200 au_data
scoreboard players operation #storm_ticks au_data += #death_ticks au_data

# +10 min per difficulty threshold achieved (12000 ticks per threshold)
function anima_ultima:storm/calculate_thresholds
scoreboard players operation #thresh_ticks au_data = #calc_thresholds au_data
scoreboard players set #const_12000 au_data 12000
scoreboard players operation #thresh_ticks au_data *= #const_12000 au_data
scoreboard players operation #storm_ticks au_data += #thresh_ticks au_data

# Set weather to thunder
weather thunder 1000000

# Calculate minutes for display
scoreboard players operation #storm_minutes au_data = #storm_ticks au_data
scoreboard players operation #storm_minutes au_data /= #const_1200 au_data

# Announcement & Sound
tellraw @a ["",{"text":"⚡ ","color":"gold","bold":true},{"text":"[Vaho Demoníaco] ","color":"dark_red","bold":true},{"text":"¡Una tormenta demoníaca azota el mundo! Los monstruos hostiles adquieren ","color":"red"},{"text":"Resistencia","color":"gold","bold":true},{"text":" y ","color":"red"},{"text":"Velocidad","color":"aqua","bold":true},{"text":".\n","color":"red"},{"text":"⏳ Duración estimada: ","color":"gray"},{"score":{"name":"#storm_minutes","objective":"au_data"},"color":"yellow","bold":true},{"text":" minutos.","color":"gray"}]

playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~ ~ 1000 0.8
playsound minecraft:entity.wither.ambient ambient @a ~ ~ ~ 1000 0.6

