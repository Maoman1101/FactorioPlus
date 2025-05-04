local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")

require("stats")

explosion_animations.cannon_nuke_explosion = function()
  return
  {
      width = 628,
      height = 720,
      frame_count = 100,
      priority = "very-low",
      flags = {"linear-magnification"},
      shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
      animation_speed = 0.5 * 0.75,
      scale = 1,
      dice_y = 5,
      stripes =
      {
        {
        filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-1.png",
        width_in_frames = 5,
        height_in_frames = 5,
        },
        {
        filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-2.png",
        width_in_frames = 5,
        height_in_frames = 5,
        },
        {
        filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-3.png",
        width_in_frames = 5,
        height_in_frames = 5,
        },
        {
        filename = "__base__/graphics/entity/nuke-explosion/nuke-explosion-4.png",
        width_in_frames = 5,
        height_in_frames = 5,
        }
      }
    
  }
end

data:extend({
{
    type = "explosion",
    name = "explosion-small",
    localised_name = {"entity-name.explosion-small"},
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.hit_explosion(),
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
  },
})

local uranium_small_explosion = util.copy(data.raw["explosion"]["explosion-small"])
uranium_small_explosion.name = "uranium-small-explosion"
uranium_small_explosion.localised_name = "entity-name.uranium-small-explosion"

for k, v in pairs(uranium_small_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
 -- if v.hr_version then
 --   v.hr_version.tint = {r = 0.4, g = 1, b = 0.4}
 -- end
end

data:extend({uranium_small_explosion})



local uranium_explosion_gunshot = util.copy(data.raw["explosion"]["explosion-gunshot"])
uranium_explosion_gunshot.name = "uranium-explosion-gunshot"
uranium_explosion_gunshot.localised_name = {"entity-name.uranium-explosion-gunshot"}

for k, v in pairs(uranium_explosion_gunshot.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
--  if v.hr_version then
--    v.hr_version.tint = {r = 0.4, g = 1, b = 0.4}
--  end
end

data:extend({uranium_explosion_gunshot})



local uranium_explosion = util.copy(data.raw["explosion"]["explosion"])
uranium_explosion.name = "uranium-explosion"
uranium_explosion.localised_name = "entity-name.uranium-explosion"

for k, v in pairs(uranium_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
--  if v.hr_version then
--    v.hr_version.tint = {r = 0.4, g = 1, b = 0.4}
--  end
end

data:extend({uranium_explosion})



local uranium_medium_explosion = util.copy(data.raw["explosion"]["medium-explosion"])
uranium_medium_explosion.name = "uranium-medium-explosion"
uranium_medium_explosion.localised_name = "entity-name.uranium-medium-explosion"

for k, v in pairs(uranium_medium_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
--  if v.hr_version then
--    v.hr_version.tint = {r = 0.4, g = 1, b = 0.4}
--  end
end

data:extend({uranium_medium_explosion})



local uranium_massive_explosion = util.copy(data.raw["explosion"]["massive-explosion"])
uranium_massive_explosion.name = "uranium-massive-explosion"
uranium_massive_explosion.localised_name = "entity-name.uranium-massive-explosion"

if uranium_massive_explosion.animations[1] then
	uranium_massive_explosion.animations[1].tint = {r = 0.4, g = 1, b = 0.4}
--	if uranium_massive_explosion.animations[1].hr_version then
--	  uranium_massive_explosion.animations[1].hr_version.tint = {r = 0.4, g = 1, b = 0.4}
--	end
end

data:extend({uranium_massive_explosion})

data:extend({
{
    type = "explosion",
    name = "cannon-nuke-explosion",
    flags = {"not-on-map"},
    hidden = true,	
	 icons =
    {
      {icon = "__base__/graphics/icons/explosion.png"},
      {icon = "__base__/graphics/icons/atomic-bomb.png"}
    },
    subgroup = "explosions",
    height = 0,
    animations = explosion_animations.cannon_nuke_explosion(),
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound = sounds.large_explosion(1.0),
},

-- {
    -- type = "corpse",
    -- name = "tiny-scorchmark-tintable",
    -- icon = "__base__/graphics/icons/small-scorchmark.png",
    -- icon_size = 64, icon_mipmaps = 4,
    -- flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    -- collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    -- collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    -- selection_box = {{-1, -1}, {1, 1}},
    -- selectable_in_game = false,
    -- time_before_removed = 60 * 60 * 5, -- 5 minutes
    -- final_render_layer = "ground-patch-higher2",
    -- subgroup = "scorchmarks",
    -- order="a-b-a",
    -- remove_on_entity_placement = false,
    -- remove_on_tile_placement = true,
    -- use_tile_color_for_ground_patch_tint = true,
    -- ground_patch =
    -- {
      -- sheet =
      -- {

          -- filename = "__base__/graphics/entity/scorchmark/hr-small-scorchmark-tintable.png",
          -- width = 256,
          -- height = 182,
          -- line_length = 4,
          -- shift = util.by_pixel(0, 2),
          -- apply_runtime_tint = true,
          -- variation_count = 4,
          -- scale = 0.25
      -- }
    -- },
    -- ground_patch_higher =
    -- {
      -- sheet =
      -- {

          -- filename = "__base__/graphics/entity/scorchmark/hr-small-scorchmark-tintable-top.png",
          -- width = 68,
          -- height = 54,
          -- line_length = 4,
          -- shift = util.by_pixel(0, -2),
          -- variation_count = 4,
          -- apply_runtime_tint = true,
          -- scale = 0.25

      -- }
    -- }
  -- },
  
{
    type = "projectile",
    name = "cannon-nuke-wave",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action =
    {
      {
        type = "area",
        radius = 3,
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
            upper_damage_modifier = 0.1,
            damage = {amount = cannon_shell_nuke_explosive_damage_explosive_shockwave, type = "explosion"}
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  },
  
  {
    type = "projectile",
    name = "cannon-nuke-wave-spawns-cluster-nuke-explosion",
    flags = {"not-on-map"},
    acceleration = 0.001,
    speed_modifier = { 1.0, 0.707 },
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "cluster-cannon-nuke-explosion",
              -- following properties are recognized only be "create-explosion" trigger
              --max_movement_distance = max_nuke_shockwave_movement_distance,
              --max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              --inherit_movement_distance_from_projectile = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },
  {
    type = "explosion",
    name = "cluster-cannon-nuke-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = smoke_animations.trivial_nuke_smoke({
      tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
      scale = 2.5 / 2,
      fade_in_duration = 10,
      duration = 20,
      fade_away_duration = 20,
      spread_duration = 100,
      start_scale = 2.5/ 2,
      end_scale = 1.5/ 2,}),
    light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}},
    scale_increment_per_tick = 0.002,
    fade_out_duration = 30,
    scale_out_duration = 20,
    scale_in_duration = 10,
    scale_initial = 0.1,
    correct_rotation = true,
    scale_animation_speed = true,
    --smoke = "smoke-fast",
    --smoke_count = 2,
    --smoke_slow_down_factor = 1,
    -- sound = sounds.small_explosion(0.5)
  },
  
  {
    type = "projectile",
    name = "cannon-nuke-wave-spawns-fire-smoke-explosion",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-explosion",
              entity_name = "cannon-nuke-fire-smoke",
              max_movement_distance = max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },
  
  {
    type = "explosion",
    name = "cannon-nuke-fire-smoke",
    fade_out_duration = 40,
    scale_out_duration = 50,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 1.5 / 2,
    scale_deviation = 0.2,
    scale_increment_per_tick = 0.005,
    correct_rotation = true,
    scale_animation_speed = true,
    animations =
    {
      {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = {-0.53125, -0.4375},
        priority = "high",
        animation_speed = 0.50,
        tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
        filename = "__base__/graphics/entity/smoke/smoke.png",
        flags = { "smoke" }
      },
    }
  },
  
  {
    type = "projectile",
    name = "cannon-nuke-wave-spawns-nuke-shockwave-explosion",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-explosion",
              entity_name = "cannon-nuke-shockwave",
              max_movement_distance = max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },
  
   {
    type = "explosion",
    name = "cannon-nuke-shockwave",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "explosions",
    height = 1.4,
    rotate = true,
    correct_rotation = true,
    fade_out_duration = 30,
    scale_out_duration = 40,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 1 / 2,
    scale_deviation = 0.2,
    scale_end = 0.5 / 2,
    scale_increment_per_tick = 0.005,
    scale_animation_speed = true,

    animations = explosion_animations.nuke_shockwave(),
  },
  
   {
    type = "projectile",
    name = "cannon-nuke-wave-spawns-nuclear-smoke",
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1.000, 0.707 },
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              repeat_count = 10 / 2,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              starting_frame = 10,
              starting_frame_deviation = 20,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.035
            },
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },
  {
    type = "particle-source",
    name = "cannon-nuke-smouldering-smoke-source",
    subgroup = "particles",
    time_to_live = 60 * 60 / 2,
    time_to_live_deviation = 30 * 60  / 2,
    time_before_start = 90,
    time_before_start_deviation = 60,
    height = 0.4,
    height_deviation = 0.1,
    vertical_speed = 0,
    vertical_speed_deviation = 0,
    horizontal_speed = 0,
    horizontal_speed_deviation = 0,
    smoke =
    {
      {
        name = "soft-fire-smoke",
        frequency = 0.10, --0.25,
        position = {0.0, 0}, -- -0.8},
        starting_frame_deviation = 60,
        starting_vertical_speed = 0.01,
        starting_vertical_speed_deviation = 0.005,
        vertical_speed_slowdown = 1, -- 0.99
      }
    }
  },
  
  
  --- EXPLOSIVE SHELL
  
 {
    type = "projectile",
    name = "cannon-explosive-wave-spawns-cluster-nuke-explosion",
    flags = {"not-on-map"},
    acceleration = 0.001,
    speed_modifier = { 1.0, 0.707 },
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "cluster-cannon-explosive-explosion",
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },
  {
    type = "explosion",
    name = "cluster-cannon-explosive-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = smoke_animations.trivial_nuke_smoke({
      tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
      scale = 2.5 / 2,
      fade_in_duration = 10,
      duration = 20,
      fade_away_duration = 20,
      spread_duration = 100,
      start_scale = 2.5/ 2,
      end_scale = 1.5/ 2,}),
    light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}},
    scale_increment_per_tick = 0.002,
    fade_out_duration = 30,
    scale_out_duration = 20,
    scale_in_duration = 10,
    scale_initial = 0.1,
    correct_rotation = true,
    scale_animation_speed = true,
  },

{
    type = "projectile",
    name = "cannon-explosive-wave-spawns-fire-smoke-explosion",
    flags = {"not-on-map"},
    acceleration = -0.001,
    speed_modifier = { 1, 0.707 },
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-explosion",
              entity_name = "cannon-explosive-fire-smoke",
              max_movement_distance = 8,
              max_movement_distance_deviation = 0.1,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            }
          }
        }
      },
    },
    animation = nil,
    shadow = nil
  },
  
  {
    type = "explosion",
    name = "cannon-explosive-fire-smoke",
    fade_out_duration = 40,
    scale_out_duration = 50,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 1.5 / 2,
    scale_deviation = 0.2,
    scale_increment_per_tick = 0.005,
    correct_rotation = true,
    scale_animation_speed = true,
    animations =
    {
      {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = {-0.53125, -0.4375},
        priority = "high",
        animation_speed = 0.50,
        tint = {r = 0.627, g = 0.478, b = 0.345, a = 0.500},
        filename = "__base__/graphics/entity/smoke/smoke.png",
        flags = { "smoke" }
      },
    }
  },
  
})
  
  
