local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
require ("__base__.prototypes.entity.pipecovers")
require ("__factorioplus__.util-building-additions")

local function electric_mining_grinder_status_colors()
  return
  {
    -- If no_power, idle, no_minable_resources, disabled, insufficient_input or full_output is used, always_draw of corresponding layer must be set to true to draw it in those states.

    no_power = { 0, 0, 0, 0 },                  -- If no_power is not specified or is nil, it defaults to clear color {0,0,0,0}

    idle = { 1, 0, 0, 1 },                      -- If idle is not specified or is nil, it defaults to white.
    no_minable_resources = { 1, 0, 0, 1 },      -- If no_minable_resources, disabled, insufficient_input or full_output are not specified or are nil, they default to idle color.
    insufficient_input = { 1, 1, 0, 1 },
    full_output = { 1, 1, 0, 1 },
    disabled = { 1, 1, 0, 1 },

    working = { 0, 1, 0, 1 },                   -- If working is not specified or is nil, it defaults to white.
    low_power = { 1, 1, 0, 1 },                 -- If low_power is not specified or is nil, it defaults to working color.
  }
end

local function electric_mining_drill_status_leds_working_visualisation()
  local led_blend_mode = nil -- "additive"
  local led_tint = {1,1,1,1}
  return
  {
    apply_tint = "status",
    always_draw = true,
    draw_as_light = true,
    north_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-n-led.png",
      width = 40,
      height = 30,
	  scale = 0.4,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
      tint = led_tint,
      shift = util.by_pixel(-50, -62),
    },
    east_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-e-led.png",
      width = 30,
      height = 40,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
	  scale = 0.4,
      tint = led_tint,
      shift = util.by_pixel(61, -52),
    },
    south_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-s-led.png",
      width = 40,
      height = 30,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
	  scale = 0.4,
      tint = led_tint,
      shift = util.by_pixel(51.5, 46),
    },
    west_animation =
    {
      filename = "__factorioplus__/graphics/electric-grinder-w-led.png",
      width = 30,
      height = 40,
      blend_mode = led_blend_mode,
	  draw_as_light = true,
	  scale = 0.4,
      tint = led_tint,
      shift = util.by_pixel(-62, 36),
    },
  }
end


data:extend({
{
    type = "mining-drill",
    name = "large-burner-mining-drill",
    icon = "__factorioplus__/graphics/icons/large-burner-miner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 0.5, result = "large-burner-mining-drill"},
    max_health = 350,
    corpse = "burner-mining-drill-remnants",
    dying_explosion = "burner-mining-drill-explosion",
    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    mining_speed = 1.0,
     working_sound =
    {
      sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.6, volume_multiplier("tips-and-tricks", 0.8)),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    allowed_effects = {}, -- no beacon effects on the burner drill
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1.2,
      fuel_inventory_size = 2,
      emissions_per_minute = {pollution= 24},
      light_flicker = {color = {0,0,0}},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5
        }
      }
    },
    energy_usage = "250kW",
	
	graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,
      min_animation_progress = 0,
      max_animation_progress = 30,

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-mining-drill-n.png",
              width = 984/4,
              height = 570/2,
			  scale = 0.5,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              shift = util.by_pixel(0, -18),
            },
			{
			  filename = "__factorioplus__/graphics/large-burner-mining-drill-n-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},		
          }
        },
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-mining-drill-e.png",
               width = 984/4,
              height = 570/2,
			  scale = 0.5,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              direction_count = 1,
              shift = util.by_pixel(0, -18),
            },   
			{
			  filename = "__factorioplus__/graphics/large-burner-mining-drill-e-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},			
          }
        },
        south =
        {
          layers =
          {
           {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-mining-drill-s.png",
               width = 984/4,
              height = 570/2,
			  scale = 0.5,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              direction_count = 1,
              shift = util.by_pixel(0, -18),
            },
			{
			  filename = "__factorioplus__/graphics/large-burner-mining-drill-s-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},		
            
          }
        },
        west =
        {
          layers =
          {
           {
              priority = "high",
              filename = "__factorioplus__/graphics/large-burner-mining-drill-w.png",
               width = 984/4,
              height = 570/2,
			  scale = 0.5,
			  line_length = 4,
              frame_count = 8,
              animation_speed = 1/2,
              direction_count = 1,
              shift = util.by_pixel(0, -18),
            },   
			{
			  filename = "__factorioplus__/graphics/large-burner-mining-drill-w-shadow.png",
			  priority = "high",
			  width = 339,
			  height = 285,
			  direction_count = 1,
			  shift = util.by_pixel(26, -18),
			  draw_as_shadow = true,
			  scale = 0.5,
			  repeat_count = 8,
			},					
          }
        },
      },

      -- shift_animation_waypoints =
      -- {
        -- -- Movement should be between 0.25-0.4 distance
        -- -- Bounds -0.5 - 0.6
        -- north = { {0, 0}, {0, -0.3}, {0, 0.1}, {0, 0.5}, {0, 0.2}, {0, -0.1}, {0, -0.5}, {0, -0.15}, {0, 0.25}, {0, 0.6}, {0, 0.3} },
        -- -- Bounds -1 - 0
        -- east = { {0, 0}, {-0.4, 0}, {-0.1, 0}, {-0.5, 0}, {-0.75, 0}, {-1, 0}, {-0.65, 0}, {-0.3, 0}, {-0.9, 0}, {-0.6, 0}, {-0.3, 0} },
        -- -- Bounds -1 - 0
        -- south = { {0, 0}, {0, -0.4}, {0, -0.1}, {0, -0.5}, {0, -0.75}, {0, -1}, {0, -0.65}, {0, -0.3}, {0, -0.9}, {0, -0.6}, {0, -0.3} },
        -- -- Bounds 0 - 1
        -- west = { {0, 0}, {0.4, 0}, {0.1, 0}, {0.5, 0}, {0.75, 0}, {1, 0}, {0.65, 0}, {0.3, 0}, {0.9, 0}, {0.6, 0}, {0.3, 0} },
      -- },

      shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
      shift_animation_transition_duration = 30 / electric_drill_animation_speed,
      
    },
	
    monitor_visualization_tint = {r=78, g=173, b=255},
    resource_searching_radius = 3.5,
	radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 7,
      height = 7
    },
    vector_to_place_result = {-0.75, -1.75},
    fast_replaceable_group = "mining-drill",

    circuit_wire_connection_points = circuit_connector_definitions["burner-mining-drill"].points,
    circuit_connector_sprites = circuit_connector_definitions["burner-mining-drill"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  
{
    type = "mining-drill",
    name = "electric-grinder",
    icon = "__factorioplus__/graphics/icons/electric-grinder.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.25, result = "electric-grinder"},
    max_health = 600,
    resource_categories = {"basic-solid"},
    corpse = "electric-mining-drill-remnants",
    dying_explosion = "electric-mining-drill-explosion",
    collision_box = {{ -2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
	working_sound =
		{
			  sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.5, volume_multiplier("tips-and-tricks", 0.8)),
			  fade_in_ticks = 4,
			  fade_out_ticks = 20
		},
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,
      min_animation_progress = 0,
      max_animation_progress = 30,

      status_colors = electric_mining_grinder_status_colors(),

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/electric-grinder-n.png",
              line_length = 4,
              width = 3480/4,
              height = 1440/2,
			  scale = 0.23,
              frame_count = 8,
              animation_speed =  1/3,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			{
            filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
            priority = "high",
            width = 870,
            height = 720,
			repeat_count = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(2, 2),
            scale = 0.225
           }
           }
        },
        east =
        {
           layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/electric-grinder-e.png",
              line_length = 4,
              width = 3480/4,
              height = 1440/2,
			scale = 0.23,
              frame_count = 8,
              animation_speed =  1/3,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			{
            filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
            priority = "high",
            width = 870,
            height = 720,
			repeat_count = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(2, 2),
            scale = 0.225
           }
           }
        },
        south =
        {
           layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/electric-grinder-s.png",
              line_length = 4,
              width = 3480/4,
              height = 1440/2,
			  scale = 0.23,
              frame_count = 8,
              animation_speed =  1/3,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			{
            filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
            priority = "high",
            width = 870,
            height = 720,
			repeat_count = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(2, 2),
            scale = 0.225
           }
           }
        },
        west =
        {
           layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/electric-grinder-w.png",
              line_length = 4,
              width = 3480/4,
              height = 1440/2,
			  scale = 0.23,
              frame_count = 8,
              animation_speed =  1/3,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			{
            filename = "__factorioplus__/graphics/electric-grinder-shadow.png",
            priority = "high",
            width = 870,
            height = 720,
			repeat_count = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(2, 2),
            scale = 0.225
           }
           }
        },
      },
	  working_visualisations =
		{
		electric_mining_drill_status_leds_working_visualisation(),
		},
	},	

    mining_speed = 0.15,
	effect_receiver = {
		base_effect = {
			productivity = 2.75,
		}
	},
	
    energy_source =
    {
      type = "electric",
      emissions_per_minute ={pollution = 4},
      usage_priority = "secondary-input"
    },
    energy_usage = "125kW",
    resource_searching_radius = 5.5,
    vector_to_place_result = {0, -2.75},
    module_slots = 3,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    fast_replaceable_group = "mining-drill",

	circuit_connector = circuit_connector_definitions["grinder"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
},

  
   {
    type = "mining-drill",
    name = "steam-turbine-miner",
    icon = "__factorioplus__/graphics/icons/turbine-miner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 0.75, result = "steam-turbine-miner"},
    max_health = 800,
    corpse = "burner-mining-drill-remnants",
    dying_explosion = "burner-mining-drill-explosion",
    collision_box = {{ -1.9, -2.4}, {1.9, 2.4}},
    selection_box = {{ -2.0, -2.5}, {2.0, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    mining_speed = 6.0,
	working_sound =
    {
      sound = sound_variations("__base__/sound/burner-mining-drill", 2, 0.5, volume_multiplier("tips-and-tricks", 0.8)),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    allowed_effects = {}, -- no beacon effects on the burner drill

    energy_source =
    {
      type = "fluid",
      effectivity = 1,
      emissions_per_minute = {pollution=4},
	  maximum_temperature = 500,	  
	  fluid_box =
		{
		  production_type = "input-output",
		  pipe_picture = assembler3pipepictures(),
		  pipe_covers = pipecoverspictures(),
		  volume = 100,
		  minimum_temperature = 100.0,
		  maximum_temperature = 1000.0,
		  filter = "steam",
		  pipe_connections =
		  {
			{flow_direction = "input-output",  direction = defines.direction.west,  position = {-1.5,2} },
			{flow_direction = "input-output",  direction = defines.direction.east,  position = {1.5, 2} }
		  }
		},
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.2, 0.2},
          frequency = 20
        }
      },
    },
    energy_usage = "0.8MW",
	graphics_set =
    {
		animation =
		{
		  north =
		  {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				 scale = 0.475,
				line_length = 4,
				shift = util.by_pixel(0, -26),
				filename = "__factorioplus__/graphics/turbine-miner-n.png",
				frame_count = 8,
				},
				{
				  filename = "__factorioplus__/graphics/steam-miner-n-shadow.png",
				  priority = "high",
				  width = 327,
				  height = 333, 
				  shift = util.by_pixel(14, -16),
				  draw_as_shadow = true,
				  scale = 0.65,
				  frame_count = 1,
				  repeat_count = 8,
				  },
			}
		  },
		  east =
		 {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				 scale = 0.4,
				line_length = 4,
				shift = util.by_pixel(0, -20),
				filename = "__factorioplus__/graphics/turbine-miner-e.png",
				frame_count = 8,
			  },
			   {
			  filename = "__factorioplus__/graphics/steam-miner-e-shadow.png",
			  priority = "high",
			  width = 327,
			  height = 333, 
			  shift = util.by_pixel(18, -18),
			  draw_as_shadow = true,
			  scale = 0.6,
			 frame_count = 1,
			  repeat_count = 8,
			  },
			}
		  },
		  south =
		 {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				 scale = 0.475,
				line_length = 4,
				shift = util.by_pixel(0, -24),
				filename = "__factorioplus__/graphics/turbine-miner-s.png",
				frame_count = 8,
			  },
			  {
			  filename = "__factorioplus__/graphics/steam-miner-s-shadow.png",
			  priority = "high",
			  width = 327,
			  height = 333, 
			  shift = util.by_pixel(14, -10),
			  draw_as_shadow = true,
			  scale = 0.65,
			 frame_count = 1,
			  repeat_count = 8,
			  },
			}
		  },
		  west =
		  {
			layers =
			{
			  {
				priority = "high",
				width = 2048/4,
				height = 1024/2,
				scale = 0.4,
				line_length = 4,
				shift = util.by_pixel(0, -20),
				filename = "__factorioplus__/graphics/turbine-miner-w.png",
				frame_count = 8,
			  },
			  {
			  filename = "__factorioplus__/graphics/steam-miner-w-shadow.png",
			  priority = "high",
			  width = 382,
			  height = 333, 
			  shift = util.by_pixel(30, -18),
			  draw_as_shadow = true,
			  scale = 0.6,
			  frame_count = 1,
			  repeat_count = 8,
			  },	
			}
		  },
		},
	},
    monitor_visualization_tint = {r=78, g=173, b=255},
    resource_searching_radius = 5,
	radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    vector_to_place_result = {0.5, -2.65},
    fast_replaceable_group = "mining-drill",
  },
    ---------------------------------------------------  SAWMILL  ------------------------------------------------------------
  {
    type = "mining-drill",
    name = "electric-sawmill",
    icon = "__factorioplus__/graphics/icons/sawmill.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "electric-sawmill"},
    max_health = 600,
    resource_categories = {"wood-solid"},
    corpse = "electric-mining-drill-remnants",
    dying_explosion = "electric-mining-drill-explosion",
    collision_box = {{ -2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 0.5
      },
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    graphics_set =
    {
      drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
      animation_progress = 1,
      min_animation_progress = 0,
      max_animation_progress = 30,

      circuit_connector_layer = "object",
      circuit_connector_secondary_draw_order = { north = 14, east = 30, south = 30, west = 30 },

      animation =
      {
        north =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-n.png",
              width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-n-shadow.png",
			  draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16,0),
             },
          },
        },
        
        east =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-e.png",
              width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },
			 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-e-shadow.png",
			   draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16, 0),
             },
          }
        },
        south =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-s.png",
               width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
            },   
 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-s-shadow.png",
			   draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16, 0),
             },			
          },    
        },
        west =
        {
          layers =
          {
            {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-w.png",
              width = 2048/4,
              height = 1024/2,
			  scale = 0.4,
              frame_count = 8,
			  line_length = 4,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
              shift = util.by_pixel(0, 0),
             },
			 {
              priority = "high",
              filename = "__factorioplus__/graphics/sawmill-w-shadow.png",
			   draw_as_shadow = true,
              width = 569,
              height = 490,
			  scale = 0.35,
              animation_speed = electric_drill_animation_speed,
              direction_count = 1,
			  repeat_count = 8,
              shift = util.by_pixel(16, 0),
             },
			 
			 
          }
        },
      },
	},
    
    mining_speed = 0.25,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = {pollution=4},
      usage_priority = "secondary-input"
    },
    energy_usage = "75kW",
    resource_searching_radius = 10.0,
    vector_to_place_result = {0, -2.75},
    module_slots = 2,

    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 10,
      height = 10
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    --fast_replaceable_group = "mining-drill",

	circuit_connector = circuit_connector_definitions["sawmill"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
    ---------------------------------------------------  GAS EXTRACTOR  ------------------------------------------------------------
  {
    type = "mining-drill",
    name = "gas-extractor",
    icon = "__factorioplus__/graphics/icons/gas-extractor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.25, result = "gas-extractor"},
    resource_categories = {"pressurized-gas"},
    max_health = 550,
    corpse = "pumpjack-remnants", --TODO
    dying_explosion = "pumpjack-explosion", --TODO
    collision_box = {{ -2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},
    energy_source =
    {
      type = "void",
		emissions_per_minute = { pollution = 4 },	  
    },
    output_fluid_box =
    {
	  production_type = "output",
      volume = 1000,
      pipe_picture = assembler2pipepictures(),
	  pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
		  direction = defines.direction.north,
          positions = { {2, -2}, {2, -2}, {-2, 2}, {-2, 2} },
          flow_direction = "output"
        }
      }
    },
    energy_usage = "50kW",
    mining_speed = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    -- module_slots = 2,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    base_render_layer = "object",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__factorioplus__/graphics/gas-extractor.png",
          priority = "extra-high",
          width = 2000/4,
          height = 469,
		  scale = 0.4,
		  shift = util.by_pixel(0, -16),
        },
		{
          filename = "__factorioplus__/graphics/gas-extractor-shadow.png",
          priority = "extra-high",
          width = 2488/4,
		  height = 469,
		  scale = 0.4,
		  shift = util.by_pixel(32, -16),
		  draw_as_shadow = true,
		  repeat_count = 4,
        },
      }
    },
	
	 graphics_set =
    {
      animation =
      {
        north =
        {
          layers =
          {
             {
            priority = "high",
            filename = "__factorioplus__/graphics/gas-extractor-anim.png",
			animation_speed = 2,
            line_length = 4,			
            width = 500,
			height = 506,
			scale = 0.4,
            frame_count = 16,
            shift = util.by_pixel(0, -4),
			},
          }
        }
      }
    },
	
	vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/pumpjack.ogg",
          volume = 0.8
        },
      },
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 10,
    },
    --fast_replaceable_group = "pumpjack",

	circuit_connector = circuit_connector_definitions["extractor"],
   circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})