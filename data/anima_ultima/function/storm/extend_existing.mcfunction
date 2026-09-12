# Extend currently running storm

# Base extension for death during storm: +5 minutes (6000 ticks)
# +1 minute for new dead player (1200 ticks) -> total 7200 ticks
scoreboard players set #added_ticks au_data 7200

# +10 minutes (12000 ticks) if this death hit a new difficulty threshold
execute if score #total_deaths au_data matches 4 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 7 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 9 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 13 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 19 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 26 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 33 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 39 run scoreboard players add #added_ticks au_data 12000
execute if score #total_deaths au_data matches 46 run scoreboard players add #added_ticks au_data 12000

# Add to remaining storm ticks
scoreboard players operation #storm_ticks au_data += #added_ticks au_data

# Ensure weather is thunder
weather thunder 1000000

# Calculate display times in minutes
scoreboard players set #const_1200 au_data 1200
scoreboard players operation #added_minutes au_data = #added_ticks au_data
scoreboard players operation #added_minutes au_data /= #const_1200 au_data

scoreboard players operation #storm_minutes au_data = #storm_ticks au_data
scoreboard players operation #storm_minutes au_data /= #const_1200 au_data

# Announcement & Sound
tellraw @a ["",{"text":"⚡ ","color":"gold","bold":true},{"text":"[Vaho Demoníaco] ","color":"dark_red","bold":true},{"text":"¡Un jugador ha muerto durante la tormenta! Se han añadido +","color":"red"},{"score":{"name":"#added_minutes","objective":"au_data"},"color":"yellow","bold":true},{"text":" minutos a la tempestad.\n","color":"red"},{"text":"⏳ Tiempo restante total: ","color":"gray"},{"score":{"name":"#storm_minutes","objective":"au_data"},"color":"yellow","bold":true},{"text":" minutos.","color":"gray"}]

playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~ ~ 1000 0.8

