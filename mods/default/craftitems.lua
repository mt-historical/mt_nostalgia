-- mods/default/craftitems.lua

minetest.register_craftitem("default:stick", {
	description = "Stick",
	inventory_image = "stick.png",
})

minetest.register_craftitem("default:coal_lump", {
	description = "Coal Lump",
	inventory_image = "lump_of_coal.png",
})

minetest.register_craftitem("default:iron_lump", {
	description = "Iron Lump",
	inventory_image = "lump_of_iron.png",
})

minetest.register_craftitem("default:steel_ingot", {
	description = "Steel Ingot",
	inventory_image = "steel_ingot.png",
})

minetest.register_craftitem("default:rat" ,{
	description = "Rat",
	inventory_image = "rat.png",
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end
			pointed_thing.under.y = pointed_thing.under.y + 1
			minetest.env:add_entity(pointed_thing.under, "mobs:rat")
			itemstack:take_item()
			return itemstack
		end,
})

minetest.register_craftitem("default:cooked_rat", {
	description = "Cooked Rat",
	inventory_image = "cooked_rat.png",
	on_use = minetest.item_eat(4),
})
