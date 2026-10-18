# ============================================================
# Summon Chupacabras (Black Wolf)
# Stats: 60 HP, Fuerza 3, Resistencia 3, Velocidad 2, Escala 0.85
# Tormenta: Resistencia 4, Velocidad 3
# ============================================================

# Paso 1: Invocar lobo con NBT básico
summon wolf ~ ~ ~ {variant:"minecraft:black",Angry:1b,anger_end_time:9999999999L,AngerTime:999999,CustomName:'\u00A74\u00A7lChupacabras',CustomNameVisible:1b,PersistenceRequired:1b,Tags:["au_chupacabras","au_chupacabras_new"]}

# Paso 2: Configurar Vida Máxima a 200 HP usando un Modificador de Atributo.
# SOLUCIÓN AL BUG MC-278994:
# Los lobos salvajes resetean su base de max_health a 8.0 en cada lectura de datos.
# Al añadir un modificador de +192 con 'add_value', la vida máxima total (8 base + 192)
# SIEMPRE es 200.0 HP, siendo 100% inmune al reseteo de la base de Minecraft.
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:max_health modifier add anima_ultima:chupacabras_hp 52 add_value

# Otros atributos de combate y tamaño
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:scale base set 0.85
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:attack_damage base set 10.0
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:movement_speed base set 0.35

# Paso 3: Curar al lobo a 200.0f HP completos
# La fórmula interna de Instant Health es (4 << amplifier).
# Con amplificador 6: cura (4 << 6) = 256 HP de golpe, llevando su vida de 8.0 a 200.0f exactos
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] instant_health 1 6 true

# Step 4: Apply initial effects
# Strength II (amplifier 1), Resistance III (amplifier 2), Speed II (amplifier 1)
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] strength 999999 3 true
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] resistance 999999 3 true
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] speed 999999 2 true

# Paso 5: Enfocar ira contra el jugador en supervivencia más cercano
execute as @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] run data modify entity @s anger_end_time set value 9999999999L
execute as @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] at @s run data modify entity @s angry_at set from entity @p[gamemode=!creative,gamemode=!spectator] UUID

# Paso 6: Quitar etiqueta temporal
tag @e[type=wolf,tag=au_chupacabras_new] remove au_chupacabras_new

# Efectos visuales y de sonido
particle minecraft:smoke ~ ~0.5 ~ 0.6 0.6 0.6 0.05 40
particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.4 0.4 0.4 0.02 20
playsound minecraft:entity.wolf.growl hostile @a ~ ~ ~ 2 0.5
playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.5 0.7

# Alerta en chat
tellraw @a[distance=..32] ["",{"text":"☠ ","color":"dark_red","bold":true},{"text":"[El Chupacabras] ","color":"red","bold":true},{"text":"¡Una bestia oscura emerge sedienta de sangre tras la matanza!","color":"dark_red","italic":true}]
