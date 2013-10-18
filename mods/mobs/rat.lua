mobs:register_mob("mobs:rat", {
	type = "animal",
	hp_max = 1,
	stepheight = 1.1,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.2, 0.4},
	visual = "upright_sprite",
	textures = {"rat.png", "rat.png"},
	visual_size = {x=1, y=0.6},
	makes_footstep_sound = false,
	walk_velocity = 1,
	armor = 200,
	drops = {},
	drawtype = "side",
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	
	on_rightclick = function(self, clicker)
		if clicker:is_player() and clicker:get_inventory() then
			clicker:get_inventory():add_item("main", "default:rat")
			self.object:remove()
		end
	end,
})
mobs:register_spawn("mobs:rat", {"default:grass", "default:stone"}, 20, -1, 7000, 1, 31000)
