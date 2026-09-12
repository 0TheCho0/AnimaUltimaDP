# Setup Scoreboards
scoreboard objectives add au_deaths minecraft.custom:minecraft.deaths "Muertes"
scoreboard objectives add au_data dummy "Anima Ultima Data"
scoreboard objectives add au_status dummy "Estado Jugador"

# Initialize global scores if not set
execute unless score #total_deaths au_data = #total_deaths au_data run scoreboard players set #total_deaths au_data 0
execute unless score #day au_data = #day au_data run scoreboard players set #day au_data 1
