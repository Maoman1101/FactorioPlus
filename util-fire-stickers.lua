local firestickerutil = {}

local fireutil = require("__base__.prototypes.fire-util")
local math3d = require "math3d"
-- FLAME WEAPON UTILITIES

-- Create a custom fire sticker
-- Stickersize = size of the flame
-- dps = damage over time
-- burntime = How long it lasts
-- movementrate = How much it slows the player if any
-- color = Color tint if needed.

--[[
function firestickerutil.makefire(firename)

--"mortar-ground-fire-flame"
local firename = firename 

local newfire = fireutil.add_basic_fire_graphics_and_effects_definitions
{
  type = "fire",
  name = firename,
  flags = {"placeable-off-grid", "not-on-map"},
  damage_per_tick = {amount = 13 / 60, type = "fire"},
  maximum_damage_multiplier = 6,
  damage_multiplier_increase_per_added_fuel = 1,
  damage_multiplier_decrease_per_tick = 0.005,

  spawn_entity = "fire-flame-on-tree",

  spread_delay = 300,
  spread_delay_deviation = 180,
  maximum_spread_count = 100,

  emissions_per_second = 0.005,

  initial_lifetime = 60 * 10,
  lifetime_increase_by = 150,
  lifetime_increase_cooldown = 4,
  maximum_lifetime = 60 * 30,
  delay_between_initial_flames = 10,
  --initial_flame_count = 1,
}
return newfire
end
]]--

function make_fire_bomblet_projectile(data)
return
{
    type = "projectile",
    name = data.name,
    flags = {"not-on-map"},
    acceleration = 0.00,
    action =
    {
	   {
        type = "area",
        radius = data.bomblet_radius,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.bomblet_sticker,
              show_in_tooltip = true
            },
            {
              type = "damage",
              damage = { amount = data.bomblet_damage, type = data.bomblet_damage_type },
              apply_damage_to_trees = false
            }
          }
        }
      },
	  {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = data.bomblet_groundfire,
              show_in_tooltip = true,
              initial_ground_flame_count = 10
            }
          }
        }
      }

    },
    -- light = {intensity = 0.5, size = 4},
    -- animation =
    -- {
      -- filename = "__base__/graphics/entity/grenade/grenade.png",
      -- frame_count = 16,
      -- line_length = 8,
      -- animation_speed = 0.250,
      -- width = 26,
      -- height = 28,
      -- shift = util.by_pixel(1, 1),
      -- priority = "high",
	  -- scale = 0.3,

    -- },
    -- shadow =
    -- {
      -- filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      -- frame_count = 16,
      -- line_length = 8,
      -- animation_speed = 0.250,
      -- width = 26,
      -- height = 20,
      -- shift = util.by_pixel(2, 6),
      -- priority = "high",
      -- draw_as_shadow = true,
    -- },
  }
end

function firestickerutil.makefiresticker(stickername, areaapplication, dps, burntime, movementrate, fireentity, color)

local stickername = stickername
local damage_interval = 10 
local dps = ((dps / 60) * damage_interval) or 0
local burntime = burntime or 30
local movementrate = movementrate or 1.0
local spread_fire_entity = fireentity or "fire-flame-on-tree"
local fire_spread_radius = areaapplication or 1.0
local color = color or { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }

return
{
    name = stickername,
    type = "sticker",
    flags = {"not-on-map"},

    animation =
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 10,
      width = 84,
      height = 130,
      frame_count = 90,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.4,
      tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 },
      shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
      draw_as_glow = true
    },

    duration_in_ticks = burntime * 60,
    damage_interval = damage_interval,
    target_movement_modifier = movementrate,
    damage_per_tick = { amount = dps, type = "fire" },
    spread_fire_entity = spread_fire_entity,
    fire_spread_cooldown = 30,
    fire_spread_radius = fire_spread_radius,
	stickers_per_square_meter = 10,
}
end

return firestickerutil