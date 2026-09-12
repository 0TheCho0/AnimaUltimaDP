# Summon black wolf Chupacabras with 40 HP, Strength 1 and Resistance 2
summon wolf ~ ~ ~ {variant:"minecraft:black",Angry:1b,AngerTime:999999,CustomName:'\u00A74\u00A7lChupacabras',CustomNameVisible:1b,PersistenceRequired:1b,Tags:["au_chupacabras"],Health:36.0f,Attributes:[{Name:"generic.max_health",Base:36.0d},{Name:"generic.attack_damage",Base:6.0d}],ActiveEffects:[{Id:"minecraft:strength",Amplifier:0,Duration:999999,ShowParticles:0b}]}


# Lock target onto the nearest survival player
execute as @e[type=wolf,tag=au_chupacabras,distance=..4] at @s run data modify entity @s AngryAt set from entity @p[gamemode=!creative,gamemode=!spectator] UUID

# Visual and sound effects
particle minecraft:smoke ~ ~0.5 ~ 0.6 0.6 0.6 0.05 40
particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.4 0.4 0.4 0.02 20
playsound minecraft:entity.wolf.growl hostile @a ~ ~ ~ 2 0.5
playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.5 0.7

# Player alert
tellraw @a[distance=..32] ["",{"text":"☠ ","color":"dark_red","bold":true},{"text":"[El Chupacabras] ","color":"red","bold":true},{"text":"¡Una bestia oscura emerge sedienta de sangre tras la matanza!","color":"dark_red","italic":true}]
