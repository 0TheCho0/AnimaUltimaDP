# Handler when a player kills a farm animal

# Revoke advancement immediately to allow subsequent detections
advancement revoke @s only anima_ultima:kill_farm_animal

# Only trigger if Diablo has at least 4 souls / deaths
execute if score #total_deaths au_data matches 4.. run function anima_ultima:chupacabras/roll_chance

