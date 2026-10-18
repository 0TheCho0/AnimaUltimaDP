# ============================================================
# Summon Chupacabras (Black Wolf)
# Stats: 200 HP, Strength II, Resistance III, Speed II
# Storm Buff: Resistance IV, Speed III
# ============================================================

# Step 1: Summon the wolf with basic NBT (variant, anger, tag, persistence)
# NOTE: We do NOT set health/attributes in the summon NBT due to MC-278994 bug
# that resets wolf max_health. We use /attribute commands after spawning instead.
# CustomName uses section-sign color codes which wolves handle correctly.
summon wolf ~ ~ ~ {variant:"minecraft:black",Angry:1b,AngerTime:999999,CustomName:'\u00A74\u00A7lChupacabras',CustomNameVisible:1b,PersistenceRequired:1b,Tags:["au_chupacabras","au_chupacabras_new"]}

# Step 2: Set attributes via /attribute command (bypasses the wolf health bug)
# Max Health: 200
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:max_health base set 200.0
# Attack Damage: 10 (strong melee)
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:attack_damage base set 10.0
# Movement Speed: slightly faster than default wolf (0.3 base)
attribute @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] minecraft:movement_speed base set 0.35

# Step 3: Heal to full after setting max_health (otherwise it spawns "damaged")
execute as @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] run data modify entity @s Health set value 200.0f

# Step 4: Apply initial effects
# Strength II (amplifier 1), Resistance III (amplifier 2), Speed II (amplifier 1)
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] strength 999999 1 true
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] resistance 999999 2 true
effect give @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] speed 999999 1 true

# Step 5: Lock target onto the nearest survival player
execute as @e[type=wolf,tag=au_chupacabras_new,limit=1,sort=nearest] at @s run data modify entity @s AngryAt set from entity @p[gamemode=!creative,gamemode=!spectator] UUID

# Step 6: Remove the "new" tag so tick handler takes over
tag @e[type=wolf,tag=au_chupacabras_new] remove au_chupacabras_new

# Visual and sound effects
particle minecraft:smoke ~ ~0.5 ~ 0.6 0.6 0.6 0.05 40
particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.4 0.4 0.4 0.02 20
playsound minecraft:entity.wolf.growl hostile @a ~ ~ ~ 2 0.5
playsound minecraft:entity.wither.ambient hostile @a ~ ~ ~ 1.5 0.7

# Player alert
tellraw @a[distance=..32] ["",{"text":"☠ ","color":"dark_red","bold":true},{"text":"[El Chupacabras] ","color":"red","bold":true},{"text":"¡Una bestia oscura emerge sedienta de sangre tras la matanza!","color":"dark_red","italic":true}]
