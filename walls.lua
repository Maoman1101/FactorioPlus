local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
 
 woodtint = {r=0.5, g=0.35, b=0.25, a=1}
 reinforcedtint = {r=0.6, g=0.6, b=0.6, a=1}
 wall_y_shift = -6
 
 data.raw["wall"]["stone-wall"].hide_resistances = false
 
 data:extend({
{
    type = "wall",
    name = "basic-wall",
    icon = "__base__/graphics/icons/wall.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.wall(),
    minable = 
	{ 
		transfer_entity_health_to_products = false,
		mining_time = 0.25, 
		results = 
		{
			{type="item", name = "stone", amount = 2}, 
		},
   },
    fast_replaceable_group = "wall",
	next_upgrade = "stone-wall",
    max_health = 300,
    repair_speed_modifier = 0,
	
	loot =
	{
		{
		count_max = 2,
		count_min = 0,
		item = "stone",
		probability = 1
		},
	},
    --corpse = "wall-remnants",
    dying_explosion = "wall-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg",volume = 0.8},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.car_stone_impact,
    -- this kind of code can be used for having walls mirror the effect
    -- there can be multiple reaction items
    --attack_reaction =
    --{
    --{
    ---- how far the mirroring works
    --range = 2,
    ---- what kind of damage triggers the mirroring
    ---- if not present then anything triggers the mirroring
    --damage_type = "physical",
    ---- caused damage will be multiplied by this and added to the subsequent damages
    --reaction_modifier = 0.1,
    --action =
    --{
    --type = "direct",
    --action_delivery =
    --{
    --type = "instant",
    --target_effects =
    --{
    --type = "damage",
    ---- always use at least 0.1 damage
    --damage = {amount = 0.1, type = "physical"}
    --}
    --}
    --},
    --}
    --},
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 50
      },
      {
        type = "impact",
        decrease = 10,
        percent = 10
      },
      {
        type = "laser",
        percent = 50
      },
	  {
        type = "fire",
        percent = 90
      },
	  {
        type = "acid",
        percent = 25
      }
    },
	hide_resistances = false,
    visual_merge_group = 1, -- different walls will visually connect to each other if their merge group is same (defaults to 0)
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-s.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      straight_vertical =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-v.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      straight_horizontal =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-h.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      corner_right_down =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-r.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      corner_left_down =
      {
		layers =
        {
          {
            filename = "__factorioplus__/graphics/basicwall/wall-l.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      t_up =
      {
		layers =
        {
          {
			filename = "__factorioplus__/graphics/basicwall/wall-td.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      ending_right =
      {
		layers =
        {
          {
			filename = "__factorioplus__/graphics/basicwall/wall-rh.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      ending_left =
      {
		layers =
        {
          {
			filename = "__factorioplus__/graphics/basicwall/wall-lh.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            variation_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, wall_y_shift),
			scale = 0.4,
          },
		  {
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
        }
      },
      filling =
		{
			filename = "__factorioplus__/graphics/basicwall/wall-f.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			variation_count = 1,
			line_length = 1,
			shift = util.by_pixel(0, -2),
			scale = 0.4,
		},
		{
			  filename = "__factorioplus__/graphics/basicwall/wall-s-shadow.png",
			  priority = "extra-high",
			  width = 128,
			  height = 128,
			  repeat_count = 1,
			  shift = util.by_pixel(4, wall_y_shift+1),
			  draw_as_shadow = true,
			  scale = 0.4,
          }
      -- },
      -- water_connection_patch =
      -- {
        -- sheets =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-patch.png",
            -- priority = "extra-high",
            -- width = 58,
            -- height = 64,
            -- shift = util.by_pixel(0, -2),
			
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-patch.png",
              -- priority = "extra-high",
              -- width = 116,
              -- height = 128,
              -- shift = util.by_pixel(0, -2),
			  
              -- scale = 0.5
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-patch-shadow.png",
            -- priority = "extra-high",
            -- width = 74,
            -- height = 52,
            -- shift = util.by_pixel(8, 14),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-patch-shadow.png",
              -- priority = "extra-high",
              -- width = 144,
              -- height = 100,
              -- shift = util.by_pixel(9, 15),
              -- draw_as_shadow = true,
              -- scale = 0.5
            -- }
          -- }
        -- }
      -- },
    },

    default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
  },
  })
  
  -- data:extend({
-- {
    -- type = "wall",
    -- name = "reinforced-wall",
    -- icon = "__base__/graphics/icons/wall.png",
    -- icon_size = 64, icon_mipmaps = 4,
    -- flags = {"placeable-neutral", "player-creation"},
    -- collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    -- selection_box = {{-1, -1}, {1, 1}},
    -- damaged_trigger_effect = hit_effects.wall(),
    -- minable = {mining_time = 0.4, result = "reinforced-wall"},
    -- fast_replaceable_group = "wall",
    -- max_health = 600,
    -- repair_speed_modifier = 2,
    -- --corpse = "wall-remnants",
    -- dying_explosion = "wall-explosion",
    -- repair_sound = sounds.manual_repair,
    -- mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg",volume = 0.8},
    -- open_sound = sounds.machine_open,
    -- close_sound = sounds.machine_close,
    -- vehicle_impact_sound = sounds.car_stone_impact,
    -- -- this kind of code can be used for having walls mirror the effect
    -- -- there can be multiple reaction items
    -- --attack_reaction =
    -- --{
    -- --{
    -- ---- how far the mirroring works
    -- --range = 2,
    -- ---- what kind of damage triggers the mirroring
    -- ---- if not present then anything triggers the mirroring
    -- --damage_type = "physical",
    -- ---- caused damage will be multiplied by this and added to the subsequent damages
    -- --reaction_modifier = 0.1,
    -- --action =
    -- --{
    -- --type = "direct",
    -- --action_delivery =
    -- --{
    -- --type = "instant",
    -- --target_effects =
    -- --{
    -- --type = "damage",
    -- ---- always use at least 0.1 damage
    -- --damage = {amount = 0.1, type = "physical"}
    -- --}
    -- --}
    -- --},
    -- --}
    -- --},
    -- resistances =
    -- {
      -- {
        -- type = "physical",
        -- decrease = 15,
        -- percent = 30
      -- },
      -- {
        -- type = "impact",
        -- decrease = 40,
        -- percent = 50
      -- },
      -- {
        -- type = "explosion",
        -- decrease = 10,
        -- percent = 40
      -- },
      -- {
        -- type = "laser",
        -- percent = 50
      -- }
    -- },
    -- visual_merge_group = 2, -- different walls will visually connect to each other if their merge group is same (defaults to 0)
    -- pictures =
    -- {
      -- single =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-single.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 46,
            -- variation_count = 2,
            -- line_length = 2,
            -- shift = util.by_pixel(0, -6),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-single.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 86,
              -- variation_count = 2,
              -- line_length = 2,
              -- shift = util.by_pixel(0, -5),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-single-shadow.png",
            -- priority = "extra-high",
            -- width = 50,
            -- height = 32,
            -- repeat_count = 2,
            -- shift = util.by_pixel(10, 16),
			
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-single-shadow.png",
              -- priority = "extra-high",
              -- width = 98,
              -- height = 60,
              -- repeat_count = 2,
              -- shift = util.by_pixel(10, 17),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- straight_vertical =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-vertical.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 68,
            -- variation_count = 5,
            -- line_length = 5,
            -- shift = util.by_pixel(0, 8),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-vertical.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 134,
              -- variation_count = 5,
              -- line_length = 5,
              -- shift = util.by_pixel(0, 8),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-vertical-shadow.png",
            -- priority = "extra-high",
            -- width = 50,
            -- height = 58,
            -- repeat_count = 5,
            -- shift = util.by_pixel(10, 28),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-vertical-shadow.png",
              -- priority = "extra-high",
              -- width = 98,
              -- height = 110,
              -- repeat_count = 5,
              -- shift = util.by_pixel(10, 29),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- straight_horizontal =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-horizontal.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 50,
            -- variation_count = 6,
            -- line_length = 6,
            -- shift = util.by_pixel(0, -4),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-horizontal.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 92,
              -- variation_count = 6,
              -- line_length = 6,
              -- shift = util.by_pixel(0, -2),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-horizontal-shadow.png",
            -- priority = "extra-high",
            -- width = 62,
            -- height = 36,
            -- repeat_count = 6,
            -- shift = util.by_pixel(14, 14),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-horizontal-shadow.png",
              -- priority = "extra-high",
              -- width = 124,
              -- height = 68,
              -- repeat_count = 6,
              -- shift = util.by_pixel(14, 15),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- corner_right_down =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-corner-right.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 64,
            -- variation_count = 2,
            -- line_length = 2,
            -- shift = util.by_pixel(0, 6),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-corner-right.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 128,
              -- variation_count = 2,
              -- line_length = 2,
              -- shift = util.by_pixel(0, 7),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-corner-right-shadow.png",
            -- priority = "extra-high",
            -- width = 62,
            -- height = 60,
            -- repeat_count = 2,
            -- shift = util.by_pixel(14, 28),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-corner-right-shadow.png",
              -- priority = "extra-high",
              -- width = 124,
              -- height = 120,
              -- repeat_count = 2,
              -- shift = util.by_pixel(17, 28),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- corner_left_down =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-corner-left.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 68,
            -- variation_count = 2,
            -- line_length = 2,
            -- shift = util.by_pixel(0, 6),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-corner-left.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 134,
              -- variation_count = 2,
              -- line_length = 2,
              -- shift = util.by_pixel(0, 7),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-corner-left-shadow.png",
            -- priority = "extra-high",
            -- width = 54,
            -- height = 60,
            -- repeat_count = 2,
            -- shift = util.by_pixel(8, 28),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-corner-left-shadow.png",
              -- priority = "extra-high",
              -- width = 102,
              -- height = 120,
              -- repeat_count = 2,
              -- shift = util.by_pixel(9, 28),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- t_up =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-t.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 68,
            -- variation_count = 4,
            -- line_length = 4,
            -- shift = util.by_pixel(0, 6),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-t.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 134,
              -- variation_count = 4,
              -- line_length = 4,
              -- shift = util.by_pixel(0, 7),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-t-shadow.png",
            -- priority = "extra-high",
            -- width = 62,
            -- height = 60,
            -- repeat_count = 4,
            -- shift = util.by_pixel(14, 28),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-t-shadow.png",
              -- priority = "extra-high",
              -- width = 124,
              -- height = 120,
              -- repeat_count = 4,
              -- shift = util.by_pixel(14, 28),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- ending_right =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-ending-right.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 48,
            -- variation_count = 2,
            -- line_length = 2,
            -- shift = util.by_pixel(0, -4),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-ending-right.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 92,
              -- variation_count = 2,
              -- line_length = 2,
              -- shift = util.by_pixel(0, -3),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-ending-right-shadow.png",
            -- priority = "extra-high",
            -- width = 62,
            -- height = 36,
            -- repeat_count = 2,
            -- shift = util.by_pixel(14, 14),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-ending-right-shadow.png",
              -- priority = "extra-high",
              -- width = 124,
              -- height = 68,
              -- repeat_count = 2,
              -- shift = util.by_pixel(17, 15),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- ending_left =
      -- {
        -- layers =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-ending-left.png",
            -- priority = "extra-high",
            -- width = 32,
            -- height = 48,
            -- variation_count = 2,
            -- line_length = 2,
            -- shift = util.by_pixel(0, -4),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-ending-left.png",
              -- priority = "extra-high",
              -- width = 64,
              -- height = 92,
              -- variation_count = 2,
              -- line_length = 2,
              -- shift = util.by_pixel(0, -3),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-ending-left-shadow.png",
            -- priority = "extra-high",
            -- width = 54,
            -- height = 36,
            -- repeat_count = 2,
            -- shift = util.by_pixel(8, 14),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-ending-left-shadow.png",
              -- priority = "extra-high",
              -- width = 102,
              -- height = 68,
              -- repeat_count = 2,
              -- shift = util.by_pixel(9, 15),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
      -- filling =
      -- {
        -- filename = "__base__/graphics/entity/wall/wall-filling.png",
        -- priority = "extra-high",
        -- width = 24,
        -- height = 30,
        -- variation_count = 8,
        -- line_length = 8,
        -- shift = util.by_pixel(0, -2),
		-- tint = reinforcedtint,
        -- hr_version =
        -- {
          -- filename = "__base__/graphics/entity/wall/hr-wall-filling.png",
          -- priority = "extra-high",
          -- width = 48,
          -- height = 56,
          -- variation_count = 8,
          -- line_length = 8,
          -- shift = util.by_pixel(0, -1),
		  -- tint = reinforcedtint,
          -- scale = 1
        -- }
      -- },
      -- water_connection_patch =
      -- {
        -- sheets =
        -- {
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-patch.png",
            -- priority = "extra-high",
            -- width = 58,
            -- height = 64,
            -- shift = util.by_pixel(0, -2),
			-- tint = reinforcedtint,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-patch.png",
              -- priority = "extra-high",
              -- width = 116,
              -- height = 128,
              -- shift = util.by_pixel(0, -2),
			  -- tint = reinforcedtint,
              -- scale = 1
            -- }
          -- },
          -- {
            -- filename = "__base__/graphics/entity/wall/wall-patch-shadow.png",
            -- priority = "extra-high",
            -- width = 74,
            -- height = 52,
            -- shift = util.by_pixel(8, 14),
            -- draw_as_shadow = true,
            -- hr_version =
            -- {
              -- filename = "__base__/graphics/entity/wall/hr-wall-patch-shadow.png",
              -- priority = "extra-high",
              -- width = 144,
              -- height = 100,
              -- shift = util.by_pixel(9, 15),
              -- draw_as_shadow = true,
              -- scale = 1
            -- }
          -- }
        -- }
      -- },
    -- },

    -- default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
  -- },
  -- })