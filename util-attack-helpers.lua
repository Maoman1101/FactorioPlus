
-- EXPLOSIVE HELPER

local radius_calc = function (max_explosive_radius, falloff_rate, radius_max, radius_cur)
local normalized_radius_cur = radius_cur/radius_max
return  (max_explosive_radius * (normalized_radius_cur / ( (falloff_rate-1) * (1-normalized_radius_cur) +1 )))
end

local damage_calc = function (max_explosive_damage, falloff_rate, radius_max, radius_cur)
local normalized_radius_cur = radius_cur/radius_max
return  (max_explosive_damage * (normalized_radius_cur / ( (falloff_rate-1) * (1-normalized_radius_cur) +1 )))
end

-- FROM 0 -> 1 -> INF
-- 0 <- 1 is a peak falloff (center is smaller, large outer falloff) 
-- 1 -> INF makes the falloff a bubble, all radii are at the edge
-- 1 is a linear falloff

-- y = x / ( (b+1) * (1-x) +1 ) -- this is from 0 - 1 then 1 - inf
--  y = radius_max / ((2^falloff_rate-1)*(1- radius_max) )  smooth from -10 -> +10
-- f(x) = x / ((1 / b - 2) * (1 - x) + 1)
-- b is the falloff 

make_explosion_wave_target_effects = function(name,damage,radius)
 local radius_epicenter = radius / 4
 -- local max_explosive_radius = radius * 2
 return 
 {
		make_explosion_anim(damage, radius),
		make_explosion_scorchmark(damage, radius),
		make_explosion_tiletrigger(damage, radius),
		make_explosion_decorativedestroy(damage, radius),
		make_explosion_smoke(damage, radius),	
		{
			type = "nested-result",
			action =
			{
			  type = "area",
			  radius = radius_epicenter,
			  action_delivery =
			  {
				type = "instant",
				target_effects =
				{
				  {
					type = "damage",
					damage = {amount = damage, type = "explosion"}
				  },
				  {
					type = "create-entity",
					entity_name = "explosion"
				  }
				}
			  }
			}
		},	 
		
		table.unpack(make_explosion_wave_effects(name,damage, radius)),
}
end

function make_smouldering_smoketrail(damage, radius)

local count = 0
local yield = ( damage / 100 ) * radius
if yield > 30 then count = 1
elseif	yield > 40 then count = 2
elseif	yield > 50 then count = 3
end 

return
{
	type = "nested-result",
	action =
		{
		  type = "area",
		  show_in_tooltip = false,
		  target_entities = false,
		  trigger_from_target = true,
		  repeat_count = count,
		  radius = radius/20,
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "create-entity",
				entity_name = "cannon-nuke-smouldering-smoke-source", -- Ending smouldering smoke
				tile_collision_mask = {layers={water_tile=true}},
			  },
			},
		  },
		},
}
end

make_explosive_damage_wave_projectile = function(name,damage,radius)
local projectile_radius = radius or 1
local e =
{
    type = "projectile",
    name = name.."-explosive-wave-projectile",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action =
    {
      {
        type = "area",
        radius = projectile_radius,
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 35,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.01,
            damage = {amount = damage, type = "explosion"}
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }
return e
end
  

make_explosion_wave_effects = function (name, damage, radius)
	local radius_outeredge = radius * 1.1
	local inner_radius = radius/2
	local epicenter_radius = radius/4
	local explosion_effects =
		{
			{
            type = "nested-result",
			show_in_tooltip = true,
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 6*inner_radius,
              radius = inner_radius,
              action_delivery =
              {
                type = "projectile",
                projectile = name.."-inner".."-explosive-wave-projectile", -- Invisible Inner damage wave
                starting_speed = 0.6 * 0.7/2 ,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
		   {
            type = "nested-result",
			show_in_tooltip = false,
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 20*radius,
              radius = radius,
              action_delivery =
              {
                type = "projectile",
                projectile = name.."-outer".."-explosive-wave-projectile", -- Invisible Outer damage wave
                starting_speed = 0.5 * 0.7/2,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10*radius,
              radius = radius,
              action_delivery =
              {
                type = "projectile",
                projectile = "cannon-explosive-wave-spawns-cluster-nuke-explosion", -- Small Dust puff initial pressure wave
                starting_speed = 0.5 * 0.8/2,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10*radius_outeredge,
              radius = radius_outeredge,
              action_delivery =
              {
                type = "projectile",
                projectile = "cannon-explosive-wave-spawns-fire-smoke-explosion", -- Medium Dust Wave
                starting_speed = 0.5 * 0.85/2,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10*inner_radius,
              radius = inner_radius,
              action_delivery =
              {
                type = "projectile",
                projectile = "cannon-nuke-wave-spawns-nuclear-smoke", -- Heavy nuke fire ending smoke wave
                starting_speed = 0.5 * 0.85/2,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              }
            }
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2 * epicenter_radius,
              radius = epicenter_radius,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "create-entity",
                    entity_name = "cannon-nuke-smouldering-smoke-source", -- Ending smouldering smoke
                    tile_collision_mask = {layers={water_tile=true}},
                  },
                },
              },
            },
          },
	  }
return explosion_effects
end

make_explosion_trigger = function (damage, max_explosive_radius, falloff_rate)
	local radius_count = 3
	local falloff = falloff_rate or 1
	local radius_damage = damage / radius_count
	local explosive_nested_result =
	{
		
		make_explosion_anim(damage, max_explosive_radius),
		make_explosion_scorchmark(damage, max_explosive_radius),
		make_explosion_tiletrigger(damage, max_explosive_radius),
		make_explosion_decorativedestroy(damage, max_explosive_radius),
		make_explosion_smoke(damage, max_explosive_radius),
		make_smouldering_smoketrail(damage, max_explosive_radius),
		{	
			type = "nested-result",
			action =
			make_explosion_areas(damage, max_explosive_radius, falloff)
		},
	}
return explosive_nested_result
end

make_explosion_smoke = function (damage, max_explosive_radius)
return
	{
		type = "create-trivial-smoke",
		smoke_name = "artillery-smoke",
		initial_height = 0,
		speed_from_center = (0.01/100) * (damage / 2) * max_explosive_radius,
		speed_from_center_deviation = 0.06 * max_explosive_radius,
		offset_deviation = {{-max_explosive_radius/3, -max_explosive_radius/3}, {max_explosive_radius/3, max_explosive_radius/3}},
		max_radius = max_explosive_radius,
		repeat_count = (damage/40) * (max_explosive_radius * 1)
	}
end

make_explosion_anim = function (damage, max_explosive_radius)
local e
yield = ( damage / 100 ) * max_explosive_radius
	if yield < 5 then e = "explosion"
	elseif	yield < 10 then e = "medium-explosion"
	elseif	yield < 20 then e = "big-explosion"
	elseif	yield < 30 then e = "big-artillery-explosion"
	else e = "massive-explosion"
	end 
local explosion = 
	{
		type = "create-entity",
		entity_name = e
	}
return explosion
end



make_explosion_scorchmark = function (damage, max_explosive_radius)

local e
yield = ( damage / 100 ) * max_explosive_radius
	if yield < 5 then e = "small-scorchmark-tintable"
	elseif yield < 10 then e = "small-scorchmark-tintable"
	elseif	yield < 20 then e = "medium-scorchmark-tintable"
	elseif	yield < 40 then e = "big-scorchmark-tintable"
	else e = "huge-scorchmark-tintable"
	end 
local crater = 	
	{
		type = "create-entity",
		entity_name = e,
		check_buildability = true
	}
return crater
end
	
make_explosion_tiletrigger = function (damage, max_explosive_radius)
return
	{
		type = "invoke-tile-trigger",
		repeat_count =  max_explosive_radius/2 + (damage / 100),
	}
end
	
make_explosion_decorativedestroy = function (damage, max_explosive_radius)
return
	{
		type = "destroy-decoratives",
		from_render_layer = "decorative",
		to_render_layer = "object",
		include_soft_decoratives = true, 
		include_decals = false,
		invoke_decorative_trigger = true,
		decoratives_with_trigger_only = false,
		radius =  (max_explosive_radius / 3) + (damage / 100)
	}
end
	


make_explosion_areas = function (damage, max_explosive_radius, falloff_rate)
	local radius_count = 3
	local falloff = falloff_rate or 1
	local radius_damage = damage / radius_count
	local explosive_result =
	{
		make_single_explosion_area(damage, max_explosive_radius, falloff, radius_count, 1),
		make_single_explosion_area(damage, max_explosive_radius, falloff, radius_count, 2),
		make_single_explosion_area(damage, max_explosive_radius, falloff, radius_count, 3)
	}
return explosive_result
end

make_single_explosion_area = function (damage, max_explosive_radius, falloff_rate, radius_count, current_radius_step)
	local falloff = falloff_rate or 1
	local radius_damage = 0
	if current_radius_step == 1 then
	radius_damage = damage_calc(damage, falloff, radius_count, 3) 
	elseif current_radius_step == 2 then
	radius_damage = damage_calc(damage, falloff, radius_count, 2) 
	elseif current_radius_step == 3 then
	radius_damage = damage_calc(damage, falloff, radius_count, 1) 
	end
	radius_damage = math.ceil(radius_damage)
	--local radius_damage = damage / ( radius_count * falloff_rate )
	-- radius_damage = damage_calc(damage, falloff, radius_count, current_radius_step) / radius_count
return 
	{
			-- max radius 
			type = "area",
			radius =  radius_calc (max_explosive_radius, falloff, radius_count, current_radius_step),
			action_delivery =
			{
			  type = "instant",
			  target_effects =
				{
					{
					  type = "damage",
					  damage = {amount = radius_damage , type = "explosion"}
					},
					{
					  type = "create-entity",
					  entity_name = "explosion"
					},
				},
			},

	}

end