-- Space age overrides

--if (mods["space-age"]) then
	
data.raw["recipe"]["railgun-turret"].ingredients = {
	{type = "item", name = "railgun", amount = 5},
	{type = "item", name = "carbon-fiber", amount = 30},
	{type = "item", name = "turret-base", amount = 10}
}
	
data.raw["recipe"]["tesla-turret"].ingredients = {
	 {type = "item", name = "teslagun", amount = 4},
	{type = "item", name = "supercapacitor", amount = 10},
      {type = "item", name = "processing-unit", amount = 10},
	  {type = "item", name = "turret-base", amount = 5}
}



-- this will allow fulgora to be rocket complete.
table.insert(data.raw["recipe"]["scrap-recycling"].results ,{type = "item", name = "explosives", amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false} )
table.insert(data.raw["recipe"]["scrap-recycling"].results ,{type = "item", name = "carbon", amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false} )

-- this will allow aquilo to be rocket complete.

table.insert(data.raw["technology"]["planet-discovery-aquilo"].effects , {type = "unlock-recipe", recipe = "ammonia-rocket-fuel-2"} )

data.raw["furnace"]["recycler"].result_inventory_size = 14,


data.extend{(
  {
    type = "recipe",
    name = "ammonia-rocket-fuel-2",
    localised_name = {"recipe-name.ammonia-rocket-fuel"},
    icon = "__space-age__/graphics/icons/ammonia-rocket-fuel.png",
    energy_required = 20,
    enabled = false,
    category = "chemistry-or-cryogenics",
    subgroup = "aquilo-processes",
    order = "a[ammonia]-c[ammonia-rocket-fuel]",
    ingredients =
    {
      {type="item", name = "rocket-fuel", amount= 2},
      {type="fluid", name = "ammonia", amount = 1000}
    },
    results = {{type="item", name="true-rocket-fuel", amount=1}},
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.996, g = 0.442, b = 0.408, a = 1.000}, -- #febd68ff
      secondary = {r = 0.446, g = 0.192, b = 0.168, a = 1.000}, -- #71632aff
      tertiary = {r = 0.347, g = 0.188, b = 0.387, a = 1.000}, -- #586262ff
      quaternary = {r = 0.656, g = 0.362, b = 0.264, a = 1.000}, -- #a78f43ff
    }
  }
 )}
 
data.raw["recipe"]["ammonia-rocket-fuel"].localised_name = {"recipe-name.ammonia-rocket-fuel"}

data.raw["recipe"]["rocket-fuel-from-jelly"].localised_name = {"recipe-name.rocket-fuel-from-jelly"}
  
-- Category updates 

data.raw.recipe["solar-panel"].category = "electronics"
data.raw.recipe["solar-array"].category = "electronics"
data.raw.recipe["solar-array-2"].category = "electronics"

data.raw.recipe["accumulator"].category = "electronics"
data.raw.recipe["accumulator-battery"].category = "electronics"
data.raw.recipe["adv-accumulator-battery"].category = "electronics"

data.raw.recipe["speed-module"].category = "electronics"
data.raw.recipe["speed-module-2"].category = "electronics"
data.raw.recipe["speed-module-3"].category = "electronics"
data.raw.recipe["speed-module-4"].category = "electronics"

data.raw.recipe["productivity-module"].category = "electronics"
data.raw.recipe["productivity-module-2"].category = "electronics"
data.raw.recipe["productivity-module-3"].category = "electronics"
data.raw.recipe["productivity-module-4"].category = "electronics"

data.raw.recipe["efficiency-module"].category = "electronics"
data.raw.recipe["efficiency-module-2"].category = "electronics"
data.raw.recipe["efficiency-module-3"].category = "electronics"
data.raw.recipe["efficiency-module-4"].category = "electronics"

data.raw.recipe["electronic-circuit"].category = "electronics"
data.raw.recipe["advanced-circuit"].category = "electronics"
data.raw.recipe["processing-unit"].category = "electronics-with-fluid"
data.raw.recipe["cpu-item"].category = "electronics"

data.raw.recipe["medium-wooden-electric-pole"].category = "electronics"
data.raw.recipe["electrical-distributor"].category = "electronics"
data.raw.recipe["huge-electric-pole"].category = "electronics"


--end