armor.register_armor("wood", {
	protection_lvl = 5, -- how much (%) it reduces the damage (for each element)
	uses = 30, --number how often it protects (for each element)
	elements = {
		head = {
			description = "Wooden Helmet",
			inventory_image = "armor_wood_head_inv.png",
			recipe = {
				{"group:wood", "group:wood", 	"group:wood"},
				{"group:wood", "", 		"group:wood"},
			}
		},
		chest = {
			description = "Wooden Chestplate",
			inventory_image = "armor_wood_chest_inv.png",
			recipe = {
				{"group:wood", "", 		"group:wood"},
				{"group:wood", "group:wood", 	"group:wood"},
				{"group:wood", "group:wood", 	"group:wood"}
			}
		},
		legs = {
			description = "Wooden Leggins",
			inventory_image = "armor_wood_legs_inv.png",
			recipe = {
				{"group:wood", "group:wood",	"group:wood"},
				{"group:wood", "", 		"group:wood"},
				{"group:wood", "", 		"group:wood"}
			}
		},
		feet = {
			description = "Wooden Shoes",
			inventory_image = "armor_wood_feet_inv.png",
			recipe = {
				{"group:wood", "", "group:wood"},
				{"group:wood", "", "group:wood"}
			}
		},
	}
})

armor.register_armor("steel", {
	protection_lvl = 15, -- how much (%) it reduces the damage (for each element)
	uses = 130, --number how often it protects (for each element)
	elements = {
		head = {
			description = "Steel Helmet",
			inventory_image = "armor_steel_head_inv.png",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot", 	"default:steel_ingot"},
				{"default:steel_ingot", "", 			"default:steel_ingot"},
			}
		},
		chest = {
			description = "Steel Chestplate",
			inventory_image = "armor_steel_chest_inv.png",
			recipe = {
				{"default:steel_ingot", "", 			"default:steel_ingot"},
				{"default:steel_ingot", "default:steel_ingot", 	"default:steel_ingot"},
				{"default:steel_ingot", "default:steel_ingot", 	"default:steel_ingot"}
			}
		},
		legs = {
			description = "Steel Leggins",
			inventory_image = "armor_steel_legs_inv.png",
			recipe = {
				{"default:steel_ingot", "default:steel_ingot",	"default:steel_ingot"},
				{"default:steel_ingot", "", 			"default:steel_ingot"},
				{"default:steel_ingot", "", 			"default:steel_ingot"}
			}
		},
		feet = {
			description = "Steel Shoes",
			inventory_image = "armor_steel_feet_inv.png",
			recipe = {
				{"default:steel_ingot", "", "default:steel_ingot"},
				{"default:steel_ingot", "", "default:steel_ingot"}
			}
		},
	}
})

armor.register_armor("diamond", {
	protection_lvl = 20, -- how much (%) it reduces the damage (for each element)
	uses = 390, --number how often it protects (for each element)
	elements = {
		head = {
			description = "Diamond Helmet",
			inventory_image = "armor_diamond_head_inv.png",
			recipe = {
				{"default:diamond", "default:diamond", 	"default:diamond"},
				{"default:diamond", "", 		"default:diamond"},
			}
		},
		chest = {
			description = "Diamond Chestplate",
			inventory_image = "armor_diamond_chest_inv.png",
			recipe = {
				{"default:diamond", "", 		"default:diamond"},
				{"default:diamond", "default:diamond", 	"default:diamond"},
				{"default:diamond", "default:diamond", 	"default:diamond"}
			}
		},
		legs = {
			description = "Diamond Leggins",
			inventory_image = "armor_diamond_legs_inv.png",
			recipe = {
				{"default:diamond", "default:diamond",	"default:diamond"},
				{"default:diamond", "", 		"default:diamond"},
				{"default:diamond", "", 		"default:diamond"}
			}
		},
		feet = {
			description = "Diamond Shoes",
			inventory_image = "armor_diamond_feet_inv.png",
			recipe = {
				{"default:diamond", "", "default:diamond"},
				{"default:diamond", "", "default:diamond"}
			}
		},
	}
})
