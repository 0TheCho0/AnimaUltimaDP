# Display AnimaUltima status report in chat

# Setup math constants
scoreboard players set #c_20 au_data 20
scoreboard players set #c_3600 au_data 3600
scoreboard players set #c_60 au_data 60
scoreboard players set #c_10 au_data 10

# Calculate total seconds
scoreboard players operation #total_sec au_data = #storm_ticks au_data
scoreboard players operation #total_sec au_data /= #c_20 au_data

# Calculate hours (tens and units)
scoreboard players operation #hours au_data = #total_sec au_data
scoreboard players operation #hours au_data /= #c_3600 au_data
scoreboard players operation #h_tens au_data = #hours au_data
scoreboard players operation #h_tens au_data /= #c_10 au_data
scoreboard players operation #h_units au_data = #hours au_data
scoreboard players operation #h_units au_data %= #c_10 au_data

# Calculate remaining seconds for minutes & seconds
scoreboard players operation #rem_sec au_data = #total_sec au_data
scoreboard players operation #rem_sec au_data %= #c_3600 au_data

# Calculate minutes (tens and units)
scoreboard players operation #minutes au_data = #rem_sec au_data
scoreboard players operation #minutes au_data /= #c_60 au_data
scoreboard players operation #m_tens au_data = #minutes au_data
scoreboard players operation #m_tens au_data /= #c_10 au_data
scoreboard players operation #m_units au_data = #minutes au_data
scoreboard players operation #m_units au_data %= #c_10 au_data

# Calculate seconds (tens and units)
scoreboard players operation #seconds au_data = #rem_sec au_data
scoreboard players operation #seconds au_data %= #c_60 au_data
scoreboard players operation #s_tens au_data = #seconds au_data
scoreboard players operation #s_tens au_data /= #c_10 au_data
scoreboard players operation #s_units au_data = #seconds au_data
scoreboard players operation #s_units au_data %= #c_10 au_data

# Print status report
tellraw @s ["",{"text":"=== [ ESTADO ANIMA ULTIMA ] ===\n","color":"gold","bold":true}]
tellraw @s [{"text":"📅 Día actual: ","color":"gray"},{"score":{"name":"#day","objective":"au_data"},"color":"yellow","bold":true}]
tellraw @s [{"text":"☠ Muertes totales: ","color":"gray"},{"score":{"name":"#total_deaths","objective":"au_data"},"color":"red","bold":true}]
tellraw @s [{"text":"⚡ Tormenta activa: ","color":"gray"},{"score":{"name":"#storm_active","objective":"au_data"},"color":"aqua","bold":true},{"text":" (1=Sí, 0=No)","color":"dark_gray"}]
tellraw @s [{"text":"⏳ Tiempo restante tormenta: ","color":"gray"},{"score":{"name":"#h_tens","objective":"au_data"},"color":"yellow","bold":true},{"score":{"name":"#h_units","objective":"au_data"},"color":"yellow","bold":true},{"text":":","color":"gold","bold":true},{"score":{"name":"#m_tens","objective":"au_data"},"color":"yellow","bold":true},{"score":{"name":"#m_units","objective":"au_data"},"color":"yellow","bold":true},{"text":":","color":"gold","bold":true},{"score":{"name":"#s_tens","objective":"au_data"},"color":"yellow","bold":true},{"score":{"name":"#s_units","objective":"au_data"},"color":"yellow","bold":true}]
tellraw @s [{"text":"===============================","color":"gold","bold":true}]
