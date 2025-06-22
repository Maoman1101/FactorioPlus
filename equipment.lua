local item_sounds = require("__base__.prototypes.item_sounds")

--------------------------------------------------- INVENTORY ARMOR OVERRIDES  ------------------------------------------------------------

data.raw["armor"]["light-armor"].inventory_size_bonus = 10
data.raw["armor"]["heavy-armor"].inventory_size_bonus = 20
data.raw["armor"]["modular-armor"].inventory_size_bonus = 30
data.raw["armor"]["power-armor"].inventory_size_bonus = 40
data.raw["armor"]["power-armor-mk2"].inventory_size_bonus = 50
if (mods["space-age"]) then
	data.raw["armor"]["mech-armor"].inventory_size_bonus = 60
end
--------------------------------------------------- ARMOUR GRID OVERRIDE  ------------------------------------------------------------

data.raw["equipment-grid"]["small-equipment-grid"].height = 6
data.raw["equipment-grid"]["medium-equipment-grid"].height = 8
data.raw["equipment-grid"]["large-equipment-grid"].height = 11
data.raw["equipment-grid"]["spidertron-equipment-grid"].height = 7
if (mods["space-age"]) then
	data.raw["equipment-grid"]["huge-equipment-grid"].height = 14
end

--------------------------------------------------- BATTERY OVERRIDE  ------------------------------------------------------------

data.raw["battery-equipment"]["battery-equipment"].energy_source.buffer_capacity = "30MJ"

data.raw["battery-equipment"]["battery-mk2-equipment"].energy_source.buffer_capacity = "200MJ"
data.raw["battery-equipment"]["battery-mk2-equipment"].shape.width = 2
data.raw["battery-equipment"]["battery-mk2-equipment"].shape.height = 3
data.raw["battery-equipment"]["battery-mk2-equipment"].sprite.scale = 0.85
if (mods["space-age"]) then
	data.raw["battery-equipment"]["battery-mk3-equipment"].energy_source.buffer_capacity = "400MJ"
	data.raw["battery-equipment"]["battery-mk3-equipment"].shape.width = 2
	data.raw["battery-equipment"]["battery-mk3-equipment"].shape.height = 4
	data.raw["battery-equipment"]["battery-mk3-equipment"].sprite.scale = 1.1
end

--------------------------------------------------- REACTORS OVERRIDE  ------------------------------------------------------------

if (mods["space-age"]) then
	data.raw["generator-equipment"]["fusion-reactor-equipment"].power = "2600kW"
	data.raw["generator-equipment"]["fusion-reactor-equipment"].shape.height = 5
	data.raw["generator-equipment"]["fusion-reactor-equipment"].sprite.scale = 1.1
end

--------------------------------------------------- LASER OVERRIDE  ------------------------------------------------------------

data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].attack_parameters.damage_modifier = 1.5
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].attack_parameters.ammo_type.energy_consumption = "60kJ"

--------------------------------------------------- EXOSKELETON OVERRIDE  ------------------------------------------------------------

data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].energy_consumption = "125kW"
data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].movement_bonus = 0.15

--------------------------------------------------- SHIELD OVERRIDE  ------------------------------------------------------------

data.raw["energy-shield-equipment"]["energy-shield-equipment"].energy_per_shield = "40kJ"

data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].shape.width = 3
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].shape.height = 3
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].energy_per_shield = "60kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].energy_source. buffer_capacity = "360kJ"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].energy_source.input_flow_limit = "720kW"

--------------------------------------------------- BACKPACK  ------------------------------------------------------------

data:extend({
 {
    type = "armor",
    name = "backpack",
    icon = "__factorioplus__/graphics/icons/backpack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "armor",
    order = "c[heavy-armor]",
    stack_size = 1,
	inventory_size_bonus = 100,
    infinite = true,
	resistances = 
	{
		  {
			type = "physical",
			decrease = 6,
			percent = 30
		  },
		  {
			type = "explosion",
			decrease = 20,
			percent = 30
		  },
		  {
			type = "acid",
			decrease = 0,
			percent = 40
		  },
		  {
			type = "fire",
			decrease = 0,
			percent = 30
		  },
	},
  },
  
  {
    type = "recipe",
    name = "backpack",
    enabled = false,
    energy_required = 8,
    ingredients = {{ type="item", name="steel-chest", amount=4}, {type="item", name="heavy-armor", amount=1}},
	results = {{type="item", name="backpack", amount=1}},
  },
  
 --------------------------------------------------- TINY EQUIPMENT GRID  ------------------------------------------------------------
 
 {
    type = "equipment-grid",
    name = "tiny-equipment-grid",
    width = 4,
    height = 4,
    equipment_categories = {"armor"},
	locked = false,
  },
  
--------------------------------------------------- OVERRIDES  ------------------------------------------------------------
{
    type = "roboport-equipment",
    name = "personal-roboport-mk2-equipment",
    take_result = "personal-roboport-mk2-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-mk2-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.75
    },
    shape =
    {
      width = 3,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "35MJ",
      input_flow_limit = "3500kW",
      usage_priority = "secondary-input"
    },
    charging_energy = "1200kW",

    robot_limit = 25,
    construction_radius = 20,
    spawn_and_station_height = 0.4,
    spawn_and_station_shadow_height_offset = 0.5,
    charge_approach_distance = 2.6,
    robots_shrink_when_entering_and_exiting = true,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 4,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
  
    {
    type = "recipe",
    name = "personal-laser-defense-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type="item", name="processing-unit", amount=10},
      {type="item", name="low-density-structure", amount=4},
      {type="item", name="laser", amount=4}
    },
	 results = {{type="item", name= "personal-laser-defense-equipment", amount=1}},
  },
  
  --------------------------------------------------- ROBOPORT EQUIPMENT MK3  ------------------------------------------------------------
{
    type = "roboport-equipment",
    name = "personal-roboport-mk3-equipment",
    take_result = "personal-roboport-mk3-equipment",
    sprite =
    {
      filename = "__factorioplus__/graphics/icons/personal-roboport-mk3-equipment-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.9
    },
    shape =
    {
      width = 4,
      height = 4,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "65MJ",
      input_flow_limit = "8500kW",
      usage_priority = "secondary-input"
    },
    charging_energy = "1500kW",

    robot_limit = 50,
    construction_radius = 25,
    spawn_and_station_height = 0.4,
    spawn_and_station_shadow_height_offset = 0.5,
    charge_approach_distance = 2.6,
    robots_shrink_when_entering_and_exiting = true,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 10,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
  
    {
    type = "recipe",
    name = "personal-roboport-mk3-equipment",
    energy_required = 60,
	enabled = false,
    ingredients =
		{
		  {type="item", name="personal-roboport-mk2-equipment", amount=2},
		  {type="item", name="cpu-item", amount=40},
		  {type="item", name="radar-large", amount=5}
		},
		results = {{type="item", name="personal-roboport-mk3-equipment", amount=1}}, 
	},
	
	{
    type = "item",
    name = "personal-roboport-mk3-equipment",
    icon = "__factorioplus__/graphics/icons/personal-roboport-mk3-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    place_as_equipment_result = "personal-roboport-mk3-equipment",
    subgroup = "utility-equipment",
    order = "e[robotics]-d[personal-roboport-equipment]",
    default_request_amount = 1,
    stack_size = 10
  },

  
  --------------------------------------------------- LONG RANGE ROBOPORT  ------------------------------------------------------------
{
    type = "roboport-equipment",
    name = "personal-long-range-roboport-equipment",
    take_result = "personal-long-range-roboport-equipment",
    sprite =
    {
      filename = "__factorioplus__/graphics/icons/personal-roboport-longrange-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
	  scale = 0.75,
    },
    shape =
    {
      width = 3,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "55MJ",
      input_flow_limit = "4500kW",
      usage_priority = "secondary-input"
    },
    charging_energy = "1200kW",

    robot_limit = 20,
    construction_radius = 40,
    spawn_and_station_height = 0.4,
    spawn_and_station_shadow_height_offset = 0.5,
    charge_approach_distance = 2.6,
    robots_shrink_when_entering_and_exiting = true,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 4,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
    {
    type = "recipe",
    name = "personal-long-range-roboport-equipment",
    energy_required = 30,
	enabled = false,
    ingredients =
    {
      {type="item", name="personal-roboport-equipment", amount=2},
      {type="item", name="processing-unit", amount=50},
      {type="item", name="low-density-structure", amount=20},
	  {type="item", name="radar", amount=20}
    },
	results = {{type="item", name="personal-long-range-roboport-equipment", amount=1}}, 
  },
    {
    type = "item",
    name = "personal-long-range-roboport-equipment",
    icon = "__base__/graphics/icons/personal-roboport-equipment.png",
    icon_size = 64, icon_mipmaps = 4,
    place_as_equipment_result = "personal-long-range-roboport-equipment",
    subgroup = "utility-equipment",
    order = "e[robotics]-c[personal-roboport-equipment]",
    default_request_amount = 1,
    stack_size = 10
  },
  
   --------------------------------------------------- SOLAR PANEL MK2  ------------------------------------------------------------
   
   {
    type = "solar-panel-equipment",
    name = "solar-panel-equipment-mk2",
    sprite =
    {
      filename = "__factorioplus__/graphics/icons/solar-panel-equipment-mk2.png",
      width = 128,
      height = 128,
      priority = "medium",
	  scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "200kW",
    categories = {"armor"}
  },
  
  {
    type = "item",
    name = "solar-panel-equipment-mk2",
    icon = "__factorioplus__/graphics/icons/solar-panel-equipment-mk2.png",
    icon_size = 128, icon_mipmaps = 4,
    place_as_equipment_result = "solar-panel-equipment-mk2",
    subgroup = "equipment",
    order = "a[energy-source]-ab[solar-panel-mk2]",
	inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    default_request_amount = 1,
    stack_size = 5
  },
  {
    type = "recipe",
    name = "solar-panel-equipment-mk2",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type="item", name="solar-panel-equipment", amount=7},
      {type="item", name="efficiency-module", amount=4},
      {type="item", name="aluminium-plate", amount=20}
    },
		results = {{type="item", name="solar-panel-equipment-mk2", amount=1}}, 
  },
   {
    type = "technology",
    name = "solar-panel-equipment-mk2",
    icon_size = 256,
    icon = "__factorioplus__/graphics/technology/personalsolarmk2.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-equipment-mk2"
      }
    },
    prerequisites = {"solar-panel-equipment","solar-energy-2","efficiency-module"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
		{"chemical-science-pack",1},
      },
      time = 60
    },
    order = "a-b-c"
  },
  
     --------------------------------------------------- FUEL GENERATOR  ------------------------------------------------------------

  {
    type = "generator-equipment",
    name = "fuel-generator-equipment",
    sprite =
    {
      filename = "__factorioplus__/graphics/icons/fuel-generator-equipment.png",
      width = 192,
      height = 128,
	  scale = 0.8,
      priority = "medium"
    },
    shape =
    {
      width = 3,
      height = 2,
      type = "full"
    },
	energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "100kW",
    categories = {"armor"}
  },
  
    {
    type = "item",
    name = "fuel-generator-equipment",
    icon = "__factorioplus__/graphics/icons/fuel-generator-equipment.png",
    icon_size = 128, icon_mipmaps = 4,
    place_as_equipment_result = "fuel-generator-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-9[fuel-gen]",
    default_request_amount = 1,
    stack_size = 5
  },
  
    {
    type = "recipe",
    name = "fuel-generator-equipment",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type="item", name="engine-unit", amount=30},
	  {type="item", name="steel-plate", amount=15},
	  {type="item", name="petroleum-fuel", amount=100},
      {type="item", name="advanced-circuit", amount=5}
    },
		results = {{type="item", name= "fuel-generator-equipment", amount=1}}, 
  },
   {
    type = "technology",
    name = "fuel-generator-equipment",
    icon_size = 256,
    icon = "__factorioplus__/graphics/technology/personalgenerator.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fuel-generator-equipment"
      }
    },
    prerequisites = {"miniturization","engine","advanced-oil-processing"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack",1},
		{"chemical-science-pack", 1},
      },
      time = 60
    },
    order = "a-b-c"
  },
  
  
  })