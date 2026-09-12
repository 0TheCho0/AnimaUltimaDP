# Roll 10% chance (1 in 10)
execute store result score #chupacabras_rng au_data run random value 1..10

# If rolled 1 (10%), summon Chupacabras
execute if score #chupacabras_rng au_data matches 1 at @s run function anima_ultima:chupacabras/spawn

