function armor.register_armor(name, def)
  if not name or not def then
    return false
  end

  armor.registered_armor[name] = def

  for k,v in pairs(def.elements) do
    local elem_def = v
    local element = tostring(k)
    elem_def.groups = v.groups or {}
    elem_def.groups["armor"] = 1
    elem_def.groups["armor_" .. element] = v.protection_lvl or def.protection_lvl
    elem_def.groups["armor_heal"] = v.uses or def.healing or 0
    elem_def.groups["armor_uses"] = v.uses or def.uses or 1
    elem_def.wear = 0

    minetest.register_tool("armor:" .. name .. "_" .. element, elem_def)

    if v.recipe then
      minetest.register_craft({
        output = "armor:" .. name .. "_" .. element,
        recipe = v.recipe,
      })
    end
  end

  return true
end
