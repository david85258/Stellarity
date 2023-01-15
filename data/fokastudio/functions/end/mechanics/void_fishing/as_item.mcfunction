# Pfft, who needs gravity?
data merge entity @s {NoGravity:1b}

# Create a vector from 2 different XYZ positions...
execute store result score #x1 foka.misc run data get entity @s Pos.[0] 1000
execute store result score #y1 foka.misc run data get entity @s Pos.[1] 1000
execute store result score #z1 foka.misc run data get entity @s Pos.[2] 1000

execute at @s facing entity @p[predicate=fokastudio:end/void_fishing/holding_fishing_rod/any] eyes run tp @s ^ ^ ^.1

execute store result score #x2 foka.misc run data get entity @s Pos.[0] 1000
execute store result score #y2 foka.misc run data get entity @s Pos.[1] 1000
execute store result score #z2 foka.misc run data get entity @s Pos.[2] 1000

scoreboard players operation #x2 foka.misc -= #x1 foka.misc
scoreboard players operation #y2 foka.misc -= #y1 foka.misc
scoreboard players operation #z2 foka.misc -= #z1 foka.misc

# ...and set fished item's velocity to it!
execute store result entity @s Motion.[0] double 0.009 run scoreboard players get #x2 foka.misc
execute store result entity @s Motion.[1] double 0.009 run scoreboard players get #y2 foka.misc
execute store result entity @s Motion.[2] double 0.009 run scoreboard players get #z2 foka.misc
