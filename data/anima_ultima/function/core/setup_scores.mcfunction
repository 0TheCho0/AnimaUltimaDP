# Setup Scoreboards
scoreboard objectives add au_deaths deathCount "Muertes"
scoreboard objectives add au_data dummy "Anima Ultima Data"
scoreboard objectives add au_status dummy "Estado Jugador"

# Initialize global scores if not set
execute unless score #total_deaths au_data = #total_deaths au_data run scoreboard players set #total_deaths au_data 0
execute unless score #day au_data = #day au_data run scoreboard players set #day au_data 1
execute unless score #storm_ticks au_data = #storm_ticks au_data run scoreboard players set #storm_ticks au_data 0
execute unless score #storm_active au_data = #storm_active au_data run scoreboard players set #storm_active au_data 0
execute unless score #weather_sync au_data = #weather_sync au_data run scoreboard players set #weather_sync au_data 0
execute unless score #chupacabras_rng au_data = #chupacabras_rng au_data run scoreboard players set #chupacabras_rng au_data 0
