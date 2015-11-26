armor = {}
armor.registered_armor = {}

armor.elements = {"head", "chest", "legs", "feet"}

local mod_path = minetest.get_modpath("armor")
dofile(mod_path .. "/api.lua")
dofile(mod_path .. "/functions.lua")
dofile(mod_path .. "/armor.lua")


minetest.register_on_joinplayer(function(player)
	armor.init_player(player)

	local player_name = player:get_player_name()
	local form_add = "list[detached:" .. player_name .. "_armor;armor_head;0,0;1,1;]" ..
			"list[detached:" .. player_name .. "_armor;armor_chest;0,1;1,1;]" ..
			"list[detached:" .. player_name .. "_armor;armor_legs;0,2;1,1;]" ..
			"list[detached:" .. player_name .. "_armor;armor_feet;0,3;1,1;]"

	if not minetest.setting_getbool("creative_mode") then
		player:set_inventory_formspec(player:get_inventory_formspec() .. form_add)
	end
end)

minetest.register_on_player_hpchange(function(player, hp_change)
	return armor.on_damage(player, hp_change)
end, true)
