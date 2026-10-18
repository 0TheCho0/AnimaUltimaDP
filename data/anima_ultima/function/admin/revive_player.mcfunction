# ============================================================
# Revivir y Desbanear Jugador (@s)
# Ejecutar como el jugador objetivo:
# /execute as <jugador> run function anima_ultima:admin/revive_player
# ============================================================

# 1. Remover etiqueta de muerte permanente
tag @s remove au_dead

# 2. Resetear estados y contadores de muerte
scoreboard players set @s au_status 0
scoreboard players set @s au_deaths 0

# 3. Restaurar modo de juego
gamemode survival @s

# 4. Restaurar salud y comida al máximo
effect give @s instant_health 1 255 true
effect give @s saturation 1 255 true

# 5. Efectos visuales y de sonido en la posición del jugador
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.1 100
execute at @s run playsound minecraft:item.totem.use player @a ~ ~ ~ 1.0 1.0

# 6. Notificaciones en pantalla y chat
title @s times 20 60 20
title @s title {"text":"HAS SIDO REVIVIDO","color":"gold","bold":true}
title @s subtitle {"text":"Tu alma ha regresado a tu cuerpo","color":"yellow","italic":true}

tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"AnimaUltima","color":"red","bold":true},{"text":"] ","color":"dark_red","bold":true},{"selector":"@s","color":"yellow","bold":true},{"text":" ha sido revivido y devuelto al juego.","color":"green"}]

