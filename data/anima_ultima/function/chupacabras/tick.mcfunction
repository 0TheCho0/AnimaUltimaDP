# ============================================================
# Chupacabras Tick Handler (runs every game tick)
# Maintains hostility, effects, and storm-conditional buffs
# ============================================================

# --- Maintain hostility ---
# Keep anger maxed so the wolf never calms down
execute as @e[type=wolf,tag=au_chupacabras] run data modify entity @s AngerTime set value 999999
# Re-target nearest survival player (in case original target dies/disconnects)
execute as @e[type=wolf,tag=au_chupacabras] at @s run data modify entity @s AngryAt set from entity @p[gamemode=!creative,gamemode=!spectator] UUID

# --- Base effects (always active) ---
# Strength II (amplifier 1)
execute as @e[type=wolf,tag=au_chupacabras] run effect give @s strength 5 1 true
# Speed II (amplifier 1) - base speed without storm
execute if score #storm_active au_data matches 0 as @e[type=wolf,tag=au_chupacabras] run effect give @s speed 5 1 true
# Resistance III (amplifier 2) - base resistance without storm
execute if score #storm_active au_data matches 0 as @e[type=wolf,tag=au_chupacabras] run effect give @s resistance 5 2 true

# --- Storm-boosted effects (when Demonic Storm / Vaho Demoníaco is active) ---
# Speed III (amplifier 2) during storm
execute if score #storm_ticks au_data matches 1.. as @e[type=wolf,tag=au_chupacabras] run effect give @s speed 5 2 true
# Resistance IV (amplifier 3) during storm
execute if score #storm_ticks au_data matches 1.. as @e[type=wolf,tag=au_chupacabras] run effect give @s resistance 5 3 true
