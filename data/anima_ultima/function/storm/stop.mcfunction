# End of storm handler
scoreboard players set #storm_active au_data 0
scoreboard players set #storm_ticks au_data 0

weather clear

tellraw @a ["",{"text":"☀️ ","color":"yellow","bold":true},{"text":"[Vaho Demoníaco] ","color":"dark_red","bold":true},{"text":"El Vaho Demoníaco se ha disipado en el horizonte. La tormenta ha cesado y las criaturas pierden su vigor.","color":"green"}]

playsound minecraft:block.beacon.deactivate ambient @a ~ ~ ~ 1000 0.8

