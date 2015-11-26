local elements = armor.elements
local armor_lvl = {}

local function calc_protection(player)
	local name = player:get_player_name()
	local armor_inv = core.get_inventory({type = "detached", name = name .. "_armor"})

	local protection = 0

	for _,v in ipairs(elements) do
		local stack = armor_inv:get_stack("armor_" .. v, 1)
		if stack:get_count() > 0 then
			local def = stack:get_definition()
			if def then
				local prot_val = def.groups["armor_" .. v] or 0
				protection = protection + prot_val
			end
		end
	end
	--default.player_armor[name] = protection

	return protection
end

function armor.add_wearout(player)
	local name = player:get_player_name()
	local armor_inv = core.get_inventory({type = "detached", name = name .. "_armor"})
	local player_inv = player:get_inventory()

	for _,v in ipairs(elements) do
		local stack = armor_inv:get_stack("armor_" .. v, 1)
		if stack:get_count() > 0 then
			local def = stack:get_definition()
			if def then
				local wearout = 65535 / (def.groups["armor_uses"] or 1)
				stack:add_wear(wearout)
				local stack2 = stack
				armor_inv:set_stack("armor_" .. v, 1, stack)
				player_inv:set_stack("armor_" .. v, 1, stack2)
			end
		end
	end
end

local function update_textures(player)
	local name = player:get_player_name()
	local armor_inv = core.get_inventory({type = "detached", name = name .. "_armor"})

	local textures = ""
	for _,v in ipairs(elements) do
		local element =  armor_inv:get_stack("armor_" .. v, 1):get_name()
		if element ~= nil and element ~= "" then
			textures = textures .. "^" .. element:gsub("%:", "_") .. ".png"
		end
	end
	if textures == "" then
		textures = "^default_armor_blank.png"
	end

	default.player_set_armor_texture(player, textures:sub(2))
end


function armor.on_damage(player, hp_change)
	if not player or not hp_change or hp_change >= 0 then
		return hp_change or 0
	end

	local name = player:get_player_name()
	if not name then
		return hp_change
	end

	local ratio = (armor_lvl[name] or 100) / 100
	local new_hp = -1
	if math.abs(hp_change) > 1 then
		new_hp = math.floor(hp_change * ratio) or 0
	else
		local get = math.random(0, 10) / 10
		if get > ratio then
			 return 0
		end
		hp_change = 0
	end
	if new_hp ~= hp_change then
		armor.add_wearout(player)
		armor.update_armor(player)
	end

	return new_hp
end

function armor.update_armor(player)
	if not player then
		return
	end
	-- calc protection value depending on current armor (0 - 100)
	local lvl = calc_protection(player)
	local name = player:get_player_name()
	-- set armor_groups depending on protection lvl
	if lvl and name then
		armor_lvl[name] = 100 - lvl
	end

	-- update armor textures
	update_textures(player)

	--update hud

end

local function is_armor(stack)
	if not stack then
		return false
	end

	local name = stack:get_name()
	local def = core.registered_items[name]
	if def and def.groups then
		if def.groups.armor ~= nil then
			return true
		end
	end

	return false
end

function armor.init_player(player)
	local name = player:get_player_name()
	local player_inv = player:get_inventory()
	local armor_inv = core.create_detached_inventory(name .. "_armor", {
		on_put = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, stack)
			armor.update_armor(player)
		end,
		on_take = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, nil)
			armor.update_armor(player)
		end,
		on_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			local plaver_inv = player:get_inventory()
			local stack = inv:get_stack(to_list, to_index)
			player_inv:set_stack(to_list, to_index, stack)
			player_inv:set_stack(from_list, from_index, nil)
			armor.update_armor(player)
		end,
		allow_put = function(inv, listname, index, stack, player)
			local field = core.registered_items[stack:get_name()]
			if (field and field.groups[listname] and field.groups[listname] ~= 0) and inv:is_empty(listname) then
				return 1
			end
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return stack:get_count()
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return count
		end,
	})

	for _,v in ipairs(elements) do
		local list = "armor_" .. v
		player_inv:set_size(list, 1)
		armor_inv:set_size(list, 1)
		armor_inv:set_stack(list, 1, player_inv:get_stack(list, 1))
	end
	armor.update_armor(player)
end
