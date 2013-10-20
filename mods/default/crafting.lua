-- mods/default/crafting.lua

minetest.register_craft({
	output = 'default:wood 4',
	recipe = {
		{'default:tree'},
	}
})

minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:sign_wall',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:torch 4',
	recipe = {
		{'default:coal_lump'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'default:plankstone 4',
	recipe = {
		{'default:stone', 'default:wood'},
		{'default:wood', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:ladder 3',
	recipe = {
		{'default:stick', '','default:stick'},
		{'default:stick', 'default:stick','default:stick'},
		{'default:stick', '', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'default:fence 2',
	recipe = {
		{'', '',''},
		{'default:stick', 'default:stick','default:stick'},
		{'default:stick', 'default:stick', 'default:stick'},
	}
})

minetest.register_craft({
	output = 'default:furnace',
	recipe = {
		{'default:stone', 'default:stone', 'default:stone'},
		{'default:stone', '', 'default:stone'},
		{'default:stone', 'default:stone', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:chest',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', '', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

minetest.register_craft({
	output = 'default:chest_locked',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:steel_ingot', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

minetest.register_craft({
	output = 'default:chest_locked',
	recipe = {
		{'default:steel_ingot'},
		{'default:chest'},
	}
})
  
 --Cooking Recipes--
  
minetest.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "default:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "default:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "default:cooked_rat",
	recipe = "default:rat",
})

--Fuel Recipes--
minetest.register_craft({
	type = "fuel",
	recipe = "default:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:leaves",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sign_wall",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:chest",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_lump",
	burntime = 40,
})


--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})


--
--Tools
--

minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_iron',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_mese',
	recipe = {
		{'default:mese', 'default:mese', 'default:mese'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'group:wood', 'group:wood', ''},
		{'group:wood', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'group:stone', 'group:stone', ''},
		{'group:stone', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_iron',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot', ''},
		{'default:iron_ingot', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_mese',
	recipe = {
		{'default:mese', 'default:mese', ''},
		{'default:mese', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'', 'group:wood', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:shovel_stone',
	recipe = {
		{'', 'group:stone', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:shovel_iron',
	recipe = {
		{'', 'default:iron_ingot', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:shovel_mese',
	recipe = {
		{'', 'default:mese', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:sword_wood',
	recipe = {
		{'', 'group:wood', ''},
		{'', 'group:wood', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:sword_stone',
	recipe = {
		{'', 'group:stone', ''},
		{'', 'group:stone', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:sword_iron',
	recipe = {
		{'', 'default:iron_ingot', ''},
		{'', 'default:iron_ingot', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:sword_mese',
	recipe = {
		{'', 'default:mese', ''},
		{'', 'default:mese', ''},
		{'', 'default:stick', ''},
	}
})
