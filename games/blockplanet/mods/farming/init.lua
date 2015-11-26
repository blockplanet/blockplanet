farming = {}
farming.path = minetest.get_modpath("farming")

-- Load files
dofile(farming.path .. "/api.lua")
dofile(farming.path .. "/nodes.lua")
dofile(farming.path .. "/hoes.lua")
dofile(farming.path .. "/plants.lua")
dofile(farming.path .. "/misc.lua")
