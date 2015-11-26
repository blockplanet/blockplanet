-- Wheat
farming.register_plant("farming:wheat", {
	description = "Wheat seed",
	inventory_image = "farming_wheat_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"}
})

-- Cotton
farming.register_plant("farming:cotton", {
	description = "Cotton seed",
	inventory_image = "farming_cotton_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland", "desert"}
})

-- Potato
farming.register_plant("farming:potato", {
	description = "Potato",
	inventory_image = "farming_potato.png",
	steps = 3,
	has_seed = false,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
  on_use = minetest.item_eat(1)
})
