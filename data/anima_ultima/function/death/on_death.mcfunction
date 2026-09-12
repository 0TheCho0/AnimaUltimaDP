# Player death handler

# 1. Reset player death counter
scoreboard players set @s au_deaths 0

# 2. Increment global soul/death counter
scoreboard players add #total_deaths au_data 1

# 3. Play global sound effects
playsound minecraft:entity.wither.spawn ambient @a ~ ~ ~ 1000 0.5
playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~ ~ 1000 0.8

# 4. Global announcement
tellraw @a ["",{"text":"\n☠ ","color":"dark_red","bold":true},{"selector":"@s","color":"red","bold":true},{"text":" ha muerto. Su alma ha sido reclamada por el Diablo.","color":"gray","italic":true}]
tellraw @a [{"text":"[Almas Recolectadas: ","color":"dark_gray"},{"score":{"name":"#total_deaths","objective":"au_data"},"color":"red","bold":true},{"text":"]\n","color":"dark_gray"}]

# 5. Execute ban logic for this player
function anima_ultima:death/ban_player
