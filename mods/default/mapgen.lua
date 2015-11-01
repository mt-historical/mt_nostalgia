-- mods/default/mapgen.lua

--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_tree", "default:tree")
minetest.register_alias("mapgen_leaves", "default:leaves")
minetest.register_alias("mapgen_jungletree", "default:tree")
minetest.register_alias("mapgen_jungleleaves", "default:leaves")
minetest.register_alias("mapgen_apple", "default:cherry")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_dirt", "default:mud")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_gravel", "default:stone")
minetest.register_alias("mapgen_clay", "default:sand")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_cobble", "default:stone")
minetest.register_alias("mapgen_mossycobble", "default:stone")
minetest.register_alias("mapgen_dirt_with_grass", "default:grass")
minetest.register_alias("mapgen_junglegrass", "default:grass")
minetest.register_alias("mapgen_stone_with_coal", "default:stone_with_coal")
minetest.register_alias("mapgen_stone_with_iron", "default:stone")
minetest.register_alias("mapgen_mese", "default:mese")
minetest.register_alias("mapgen_desert_sand", "default:dirt")
minetest.register_alias("mapgen_desert_stone", "default:stone")

--
-- Ore generation
--

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 8,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = 64,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	height_min     = -31000,
	height_max     = 0,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -15,
	height_max     = 2,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -63,
	height_max     = -16,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 7*7*7,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -64,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	height_min     = -31000,
	height_max     = -64,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:mese",
	wherein        = "default:stone",
	clust_scarcity = 18*18*18,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -255,
	height_max     = -64,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:mese",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -256,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:mese",
	wherein        = "default:stone",
	clust_scarcity = 36*36*36,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -31000,
	height_max     = -1024,
	flags          = "absheight",
})
