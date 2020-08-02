
# Shows everyone the Sleeping text, but only if there are at least 2 players online
execute as @a[nbt={SleepTimer:100s}] if score .online hps_sleep matches 2.. run title @a actionbar ["",{"score":{"name":".sleeping","objective":"hps_sleep"},"color":"yellow"},{"text":" of ","color":"dark_purple"},{"score":{"name":".half","objective":"hps_sleep"},"color":"yellow"},{"text":" players are sleeping!","color":"dark_purple"}]
execute as @a[nbt={SleepTimer:100s}] if score .online hps_sleep matches 2.. run advancement grant @a[advancements={half_player_sleep_pack:half_player_sleep/root=false}] only half_player_sleep_pack:half_player_sleep/root

# Take the advancement if no one is sleeping
execute if score .sleeping hps_sleep matches 0 run advancement revoke @a[advancements={half_player_sleep_pack:half_player_sleep/root=true}] only half_player_sleep_pack:half_player_sleep/root

# Adds the counter of how many players are online
scoreboard players set .online hps_sleep 0
execute as @a[nbt={Dimension:"minecraft:overworld"}] run scoreboard players add .online hps_sleep 1

# Stores the online score amount in the half score and divisions it with the division score
execute store result score .half hps_sleep run scoreboard players get .online hps_sleep
scoreboard players operation .half hps_sleep /= .division hps_sleep

# Adds the counter of how many players are sleeping
scoreboard players set .sleeping hps_sleep 0
execute as @a[nbt={SleepTimer:100s}] run scoreboard players add .sleeping hps_sleep 1

# If the score sleeping is or is higher then the half score and the half account isn't 0 then the time and weather changes
execute if score .sleeping hps_sleep >= .half hps_sleep unless score .half hps_sleep matches 0 run time add 100
execute if score .sleeping hps_sleep >= .half hps_sleep unless score .half hps_sleep matches 0 run weather rain 1