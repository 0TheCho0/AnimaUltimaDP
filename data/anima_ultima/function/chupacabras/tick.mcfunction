# Maintain Chupacabras hostility towards nearest survival player
execute as @e[type=wolf,tag=au_chupacabras] run data modify entity @s AngerTime set value 999999
execute as @e[type=wolf,tag=au_chupacabras] at @s run data modify entity @s AngryAt set from entity @p[gamemode=!creative,gamemode=!spectator] UUID

# Maintain continuous buffs (Resistance 2 = amp 1, Strength 1 = amp 0)
execute as @e[type=wolf,tag=au_chupacabras] run effect give @s resistance 5 1 true
execute as @e[type=wolf,tag=au_chupacabras] run effect give @s strength 5 0 true

# Receive Speed 1 if Demonic Storm (Vaho Demoníaco) is active
execute if score #storm_ticks au_data matches 1.. as @e[type=wolf,tag=au_chupacabras] run effect give @s speed 3 0 true
