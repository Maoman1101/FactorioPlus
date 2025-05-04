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