-- minetest/creative/init.lua

-- SETTINGS --

-- Shows the trash slot to players in survival mode
local SURVIVAL_TRASH = true

-- "Special" Mode
local ALL_THE_THINGS = false

-- END OF SETTINGS --





-- Register a "creative" priv
minetest.register_privilege("creative", {
	description = "Can use the creative inventory",
	give_to_singleplayer = false,
})

creative_inventory = {}
creative_inventory.creative_inventory_size = 0

-- Determine if the player is running in creative mode
function creative_inventory.is_creative(player)
    playername=player:get_player_name()
	if minetest.check_player_privs(playername, {creative=true}) or
	   minetest.setting_getbool("creative_mode") then
		return true
	end
end

-- Create detached creative inventory after loading all mods
minetest.after(0, function()
	local inv = minetest.create_detached_inventory("creative", {
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			if creative_inventory.is_creative(player) then
				return count
			else
				return 0
			end
		end,
		allow_put = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			if creative_inventory.is_creative(player) then
				return -1
			else
				return 0
			end
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		end,
		on_put = function(inv, listname, index, stack, player)
		end,
		on_take = function(inv, listname, index, stack, player)
			print(player:get_player_name().." takes item from creative inventory; listname="..dump(listname)..", index="..dump(index)..", stack="..dump(stack))
			if stack then
				print("stack:get_name()="..dump(stack:get_name())..", stack:get_count()="..dump(stack:get_count()))
			end
		end,
	})
	local creative_list = {}
	for name,def in pairs(minetest.registered_items) do
		if (not def.groups.not_in_creative_inventory or def.groups.not_in_creative_inventory == 0)
				and def.description and def.description ~= "" then
			table.insert(creative_list, name)
		end
	end
	table.sort(creative_list)
	inv:set_size("main", #creative_list)
	for _,itemstring in ipairs(creative_list) do
		local stack = ItemStack(itemstring)
		stack:set_count(stack:get_stack_max())
		inv:add_item("main", stack)
	end
	creative_inventory.creative_inventory_size = #creative_list
	print("creative inventory size: "..dump(creative_inventory.creative_inventory_size))
end)

-- Create the trash field
local trash = minetest.create_detached_inventory("creative_trash", {
	-- Allow the stack to be placed and remove it in on_put()
	-- This allows the creative inventory to restore the stack
	allow_put = function(inv, listname, index, stack, player)
			return stack:get_count()
	end,
	on_put = function(inv, listname, index, stack, player)
		inv:set_stack(listname, index, "")
	end,
})
trash:set_size("main", 1)


-- Create the refill field
local refill = minetest.create_detached_inventory("creative_refill", {
	-- Allow the stack to be placed and remove it in on_put()
	-- This allows the creative inventory to restore the stack
	allow_put = function(inv, listname, index, stack, player)
			return stack:get_count()
	end,
	on_put = function(inv, listname, index, stack, player)
	if stack:get_wear() == 0 then
			inv:set_stack(listname, index, "")
			stack:set_count(stack:get_stack_max())
			inv:add_item("main", stack)
	else
		print("Tool detected in refill slot. Current wear is: "..tostring(stack:get_wear())..". Will add "..tostring((-1)*stack:get_wear()).." wear.")
		stack:add_wear((-1)*stack:get_wear())
		print("Tool now has "..tostring(stack:get_wear()).." wear.")
		inv:set_stack(listname, index, "")
		inv:add_item("main", stack)
	end

	end,
})
refill:set_size("main", 1)


creative_inventory.set_creative_formspec = function(player, start_i, pagenum)
	pagenum = math.floor(pagenum)
	local pagemax = math.floor((creative_inventory.creative_inventory_size-1) / (6*4) + 1)
	local formspec = ("size[13,7.5]"..
			--"image[6,0.6;1,2;player.png]"..
			"list[current_player;main;5,3.5;8,4;]"..
			"list[current_player;craft;8,0;3,3;]"..
			"list[current_player;craftpreview;12,1;1,1;]"..
			"list[detached:creative;main;0.3,0.5;4,6;"..tostring(start_i).."]"..
			"label[2.0,6.55;"..tostring(pagenum).."/"..tostring(pagemax).."]"..
			"button[0.3,6.5;1.6,1;creative_prev;<<]"..
			"button[2.7,6.5;1.6,1;creative_next;>>]"..
			"label[5,1.5;Trash:]"..
			"list[detached:creative_trash;main;5,2;1,1;]"..
			"label[5,0;Refill:]"..
			"list[detached:creative_refill;main;5,0.5;1,1;]")
	if (ALL_THE_THINGS) then
		formspec = formspec.."button[6,2.7;2.5,1;clear;Remove _ALL_ the things!]".."image_button[6,1;2,2;all_the_things.png;clear;]"
	else
		formspec = formspec.."button[6,2;2,1;clear;Clear Inventory]"
	end
	player:set_inventory_formspec(formspec)
end
creative_inventory.set_survival_formspec = function(player)
	local formspec = player:get_inventory_formspec()
	if (SURVIVAL_TRASH) then
		formspec = formspec.."list[detached:creative_trash;main;0,2;1,1;]".."label[0,1.5;Trash:]"
	end
	player:set_inventory_formspec(formspec)
end
creative_inventory.clear_inventory = function(player)
		player:get_inventory():set_list("main", {})
		local player_name = player:get_player_name()
		minetest.chat_send_player(player_name, 'Inventory Cleared!')
end
minetest.register_on_joinplayer(function(player)
	-- If in creative mode, modify player's inventory forms
	if not creative_inventory.is_creative(player) then
		creative_inventory.set_survival_formspec(player)
		return
	end
	creative_inventory.set_creative_formspec(player, 0, 1)
end)
minetest.register_on_player_receive_fields(function(player, formname, fields)
	-- Figure out current page from formspec
	local current_page = 0
	local formspec = player:get_inventory_formspec()
	local start_i = string.match(formspec, "list%[detached:creative;main;[%d.]+,[%d.]+;[%d.]+,[%d.]+;(%d+)%]")
	start_i = tonumber(start_i) or 0

	if fields.clear then
		creative_inventory.clear_inventory(player)
	end
	if creative_inventory.is_creative(player) then
		if fields.creative_prev then
			start_i = start_i - 4*6
		end
		if fields.creative_next then
			start_i = start_i + 4*6
		end

		if start_i < 0 then
			start_i = start_i + 4*6
		end
		if start_i >= creative_inventory.creative_inventory_size then
			start_i = start_i - 4*6
		end
		
		if start_i < 0 or start_i >= creative_inventory.creative_inventory_size then
			start_i = 0
		end

		creative_inventory.set_creative_formspec(player, start_i, start_i / (6*4) + 1)
	end
end)

if minetest.setting_getbool("creative_mode") then
	
	minetest.register_item(":", {
		type = "none",
		wield_image = "wieldhand.png",
		wield_scale = {x=1,y=1,z=2.5},
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = {times={[1]=0.5, [2]=0.5, [3]=0.5}, uses=0, maxlevel=3},
				cracky = {times={[1]=0.5, [2]=0.5, [3]=0.5}, uses=0, maxlevel=3},
				snappy = {times={[1]=0.5, [2]=0.5, [3]=0.5}, uses=0, maxlevel=3},
				choppy = {times={[1]=0.5, [2]=0.5, [3]=0.5}, uses=0, maxlevel=3},
				oddly_breakable_by_hand = {times={[1]=0.5, [2]=0.5, [3]=0.5}, uses=0, maxlevel=3},
			},
			damage_groups = {fleshy = 10},
		}
	})
	
	function minetest.handle_node_drops(pos, drops, digger)
		if not digger or not digger:is_player() then
			return
		end
		local inv = digger:get_inventory()
		if inv then
			for _,item in ipairs(drops) do
				item = ItemStack(item):get_name()
				if not inv:contains_item("main", item) then
					inv:add_item("main", item)
				end
			end
		end
	end
	
end
