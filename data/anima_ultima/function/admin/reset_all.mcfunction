# Reset all AnimaUltima game data for testing
scoreboard players set #total_deaths au_data 0
scoreboard players set #storm_ticks au_data 0
scoreboard players set #storm_active au_data 0
scoreboard players set #weather_sync au_data 0
scoreboard players set #day au_data 3

# Reset weather
weather clear

# Reset all players
tag @a remove au_dead
scoreboard players set @a au_status 0
scoreboard players set @a au_deaths 0
gamemode survival @a

tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"AnimaUltima","color":"red","bold":true},{"text":"] ","color":"dark_red","bold":true},{"text":"Todas las estadísticas, muertes y tormentas han sido reiniciadas. Día establecido en 3.","color":"green"}]
