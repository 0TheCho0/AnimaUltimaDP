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

# 4b. Anuncio especial al alcanzar la 4ta muerte (Despertar del Chupacabras)
execute if score #total_deaths au_data matches 4 run playsound minecraft:entity.wolf.howl ambient @a ~ ~ ~ 1000 0.6
execute if score #total_deaths au_data matches 4 run tellraw @a ["",{"text":"☠ ","color":"dark_red","bold":true},{"text":"[El Diablo] ","color":"red","bold":true},{"text":"El Diablo ha recolectado 4 almas, su influencia en el mundo terrenal aumenta, despertando así al chupacabras que acecha en la sombra a los animales.\n","color":"gold","italic":true},{"text":"(Probabilidad de invocar al chupacabras al matar cualquier animal de granja).\n","color":"yellow","italic":true}]

# 5. Execute ban logic for this player
function anima_ultima:death/ban_player

# 6. Trigger Day 3 Demonic Storm (Vaho Demoníaco)
execute if score #day au_data matches 3.. run function anima_ultima:storm/start_or_extend
