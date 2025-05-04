local control_name = "enemy-base"

local function abandonments_autoplace(params)
  return
  {
    control = params.control or control_name,
    order = params.order or "b[enemy]-misc",
    force = "abandonments",
    probability_expression = params.probability_expression,
    richness_expression = 1
  }
end

local function abandonments_loot_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-c[lootbuildings]"
	order = "00",
  }
end

local function abandonments_ground_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
    order = "11",
	is_ground = true
  }
end


local function abandonments_poles_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-b[poles]",
	order = "22",
  }
end


local function abandonments_buildings_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-d[buildings]"
	order = "33",
  }
end

local function abandonments_buildings2_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-d[buildings]"
	order = "34",
  }
end

local function abandonments_auxbuildings_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-e[auxbuildings]"

	order = "44",
  }
end


local function abandonments_turrets_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	  probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-f[turrets]",
	order = "55",
    is_turret = true
  }
end

local function abandonments_decoratives_autoplace(probability_expression)
  return abandonments_autoplace{
    distance_factor = distance,
	probability_expression = "(" .. probability_expression .. ") * (1 - no_enemies_mode)",
--    order = "b[enemy]-f[turrets]",,
	order = "66",
  }
end

return
{
	control_name = control_name,
	abandonments_autoplace = abandonments_autoplace,
	abandonments_ground_autoplace = abandonments_ground_autoplace,
	abandonments_loot_autoplace = abandonments_loot_autoplace,
	abandonments_buildings_autoplace = abandonments_buildings_autoplace,
	abandonments_buildings2_autoplace = abandonments_buildings2_autoplace,
	abandonments_poles_autoplace = abandonments_poles_autoplace,
	abandonments_auxbuildings_autoplace = abandonments_auxbuildings_autoplace,
	abandonments_turrets_autoplace = abandonments_turrets_autoplace,
	abandonments_decoratives_autoplace = abandonments_decoratives_autoplace
} 
  

