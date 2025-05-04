data.raw["character"]["character"].mining_categories = {"basic-solid","wood-solid"}
data.raw["character"]["character"].inventory_size = 50
data.raw["character"]["character"].synced_footstep_particle_triggers = require("movement_triggers").character

---- NEW CHARACTER ----

local kbold_running_anims = 
{
	{
      filename = "__factorioplus__/graphics/player/player_running.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.4,
      scale = 0.3,
      usage = "player",
	  },
	  	{
      filename = "__factorioplus__/graphics/player/player_running_mask.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.4,
      scale = 0.3,
	  apply_runtime_tint = true,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/player_running_shadow.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(12,-3),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.4,
      scale = 0.25,
	  draw_as_shadow = true,
      usage = "player",
	  }
}

local kbold_idle_anims = 
{
	{
      filename = "__factorioplus__/graphics/player/player_idle.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.25,
      scale = 0.3,
      usage = "player",
	  },
	  	{
      filename = "__factorioplus__/graphics/player/player_idle_mask.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.25,
      scale = 0.3,
	  apply_runtime_tint = true,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/player_idle_shadow.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(12,-3),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.4,
      scale = 0.25,
	  draw_as_shadow = true,
      usage = "player",
	  }
}

local kbold_mining_anims = 
{
	{
      filename = "__factorioplus__/graphics/player/player_mining.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8, 
      animation_speed = 0.6,
      scale = 0.3,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/player_mining_mask.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.6,
      scale = 0.3,
	  apply_runtime_tint = true,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/player_mining_shadow.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(16,-3),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.6,
      scale = 0.4,
	  draw_as_shadow = true,
      usage = "player",
	  }
}

local kbold_weapon_idle_anims = 
{
	{
      filename = "__factorioplus__/graphics/player/p_weapon_idle.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8, 
      animation_speed =  0.25,
      scale = 0.3,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/p_weapon_idle_mask.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 8,
      animation_speed = 0.25,
      scale = 0.3,
	  apply_runtime_tint = true,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/p_weapon_idle_shadow.png",
      width = 4096/16,
      height = 2048/8,
      shift = util.by_pixel(16,-3),
      frame_count = 16,
      direction_count = 8,
      animation_speed =  0.25,
      scale = 0.4,
	  draw_as_shadow = true,
      usage = "player",
	  }
}

local kbold_weapon_running_anims = 
{
	{
      filename = "__factorioplus__/graphics/player/p_weapon_run.png",
      width = 4096/16,
      height = 4608/18,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 18, 
      animation_speed = 0.4,
      scale = 0.3,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/p_weapon_run_mask.png",
      width = 4096/16,
      height = 4608/18,
      shift = util.by_pixel(-4,-26),
      frame_count = 16,
      direction_count = 18,
      animation_speed = 0.4,
      scale = 0.3,
	  apply_runtime_tint = true,
      usage = "player",
	  },
	  {
      filename = "__factorioplus__/graphics/player/p_weapon_run_shadow.png",
      width = 4096/16,
      height = 4608/18,
      shift = util.by_pixel(16,-3),
      frame_count = 16,
      direction_count = 18,
      animation_speed = 0.4,
      scale = 0.4,
	  draw_as_shadow = true,
      usage = "player",
	  }
}

local kbold_weapon_running_shadowflipped_anims = 
{
	{
      filename = "__factorioplus__/graphics/player/p_weapon_run_shadow_flipped.png",
      width = 4096/16,
      height = 4608/18,
      shift = util.by_pixel(16,-3),
      frame_count = 16,
      direction_count = 18, 
      animation_speed = 0.4,
      scale = 0.4,
      usage = "player",
	  }
}

local kbold_dead= 
{
    {
      filename = "__factorioplus__/graphics/player/p_dead.png",
      width = 256,
      height = 256,
      shift = util.by_pixel(-4,-6),
      frame_count = 2,
      scale = 0.3,
      usage = "player"
    },
    {
      filename = "__factorioplus__/graphics/player/p_dead_mask.png",
      width = 256,
      height = 256,
      shift = util.by_pixel(-4,-6),
      frame_count = 2,
      apply_runtime_tint = true,
      scale = 0.3,
      usage = "player"
    },
    {
      filename = "__factorioplus__/graphics/player/p_dead_shadow.png",
      width = 256,
      height = 256,
      shift = util.by_pixel(-4,-6),
      frame_count = 2,
      draw_as_shadow = true,
      scale = 0.3,
      usage = "player"
    },
}

if  settings.startup["settings-character-selection"].value == "kobold" then

data.raw["character-corpse"]["character-corpse"].pictures[1].layers = kbold_dead
data.raw["character-corpse"]["character-corpse"].pictures[2].layers = kbold_dead
data.raw["character-corpse"]["character-corpse"].pictures[3].layers = kbold_dead
data.raw["character"]["character"].icon = "__factorioplus__/graphics/icons/character-kobold.png"
data.raw["character"]["character"].running_speed = data.raw["character"]["character"].running_speed * 0.8
data.raw["character"]["character"].collision_box = {{-0.16, -0.16}, {0.16, 0.16}}
data.raw["character"]["character"].mining_speed = 1.0
data.raw["character"]["character"].max_health = 125
data.raw["character"]["character"].damage_hit_tint = {0.25, 0, 0, 0}

data.raw["character"]["character"].animations[1].running.layers = kbold_running_anims
data.raw["character"]["character"].animations[1].idle.layers = kbold_idle_anims
data.raw["character"]["character"].animations[1].mining_with_tool.layers = kbold_mining_anims
data.raw["character"]["character"].animations[1].idle_with_gun.layers = kbold_weapon_idle_anims
data.raw["character"]["character"].animations[1].running_with_gun.layers = kbold_weapon_running_anims
data.raw["character"]["character"].animations[1].flipped_shadow_running_with_gun.layers = kbold_weapon_running_shadowflipped_anims

data.raw["character"]["character"].animations[2].running.layers = kbold_running_anims
data.raw["character"]["character"].animations[2].idle.layers = kbold_idle_anims
data.raw["character"]["character"].animations[2].mining_with_tool.layers = kbold_mining_anims
data.raw["character"]["character"].animations[2].idle_with_gun.layers = kbold_weapon_idle_anims
data.raw["character"]["character"].animations[2].running_with_gun.layers = kbold_weapon_running_anims
data.raw["character"]["character"].animations[2].flipped_shadow_running_with_gun.layers = kbold_weapon_running_shadowflipped_anims

data.raw["character"]["character"].animations[3].running.layers = kbold_running_anims
data.raw["character"]["character"].animations[3].idle.layers = kbold_idle_anims
data.raw["character"]["character"].animations[3].mining_with_tool.layers = kbold_mining_anims
data.raw["character"]["character"].animations[3].idle_with_gun.layers = kbold_weapon_idle_anims
data.raw["character"]["character"].animations[3].running_with_gun.layers = kbold_weapon_running_anims
data.raw["character"]["character"].animations[3].flipped_shadow_running_with_gun.layers = kbold_weapon_running_shadowflipped_anims

end