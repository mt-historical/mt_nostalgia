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
minetest.register_alias("mapgen_river_water_source", "default:water_source")
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
function default.register_ores()

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
end

--biomes

function default.register_biomes()
	minetest.clear_registered_biomes()

	minetest.register_biome({
		name = "stone_grassland",
		--node_dust = "",
		node_top = "default:grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 0,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 5,
		y_max = 31000,
		heat_point = 45,
		humidity_point = 25,
	})

	minetest.register_biome({
		name = "stone_land_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = 4,
		heat_point = 45,
		humidity_point = 25,
	})

	minetest.register_biome({
		name = "deciduous_forest",
		--node_dust = "",
		node_top = "default:grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 1,
		y_max = 31000,
		heat_point = 70,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_swamp",
		--node_dust = "",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3,
		y_max = 0,
		heat_point = 70,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "deciduous_forest_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = -4,
		heat_point = 70,
		humidity_point = 75,
	})


	-- Hot

	minetest.register_biome({
		name = "desert",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		node_stone = "default:stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 5,
		y_max = 31000,
		heat_point = 95,
		humidity_point = 10,
	})

	minetest.register_biome({
		name = "desert_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_stone = "default:stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = 4,
		heat_point = 95,
		humidity_point = 10,
	})

	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "",
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})
end

function default.register_decorations()
	minetest.clear_registered_decorations()

	-- Apple tree

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.02,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
	})
end

local mg_params = minetest.get_mapgen_params()
if mg_params.mgname == "v6" then
	default.register_ores()
elseif mg_params.mgname ~= "singlenode" then
	default.register_ores()
	default.register_biomes()
	default.register_decorations()
end
