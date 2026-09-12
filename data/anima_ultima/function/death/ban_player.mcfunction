# Ban/Permadeath execution for current player (@s)

# Tag and update status
tag @s add au_dead
scoreboard players set @s au_status 1

# Change gamemode to spectator
gamemode spectator @s

# Title notification
title @s times 20 100 20
title @s title {"text":"HAS MUERTO","color":"dark_red","bold":true}
title @s subtitle {"text":"Tu alma ahora le pertenece al Diablo","color":"red","italic":true}

# Attempt server kick
execute if entity @s run kick @s Has muerto. Tu alma ahora le pertenece al Diablo.
