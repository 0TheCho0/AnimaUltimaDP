# Calculate number of death difficulty thresholds achieved
scoreboard players set #calc_thresholds au_data 0

execute if score #total_deaths au_data matches 4.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 7.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 9.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 13.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 19.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 26.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 33.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 39.. run scoreboard players add #calc_thresholds au_data 1
execute if score #total_deaths au_data matches 46.. run scoreboard players add #calc_thresholds au_data 1

