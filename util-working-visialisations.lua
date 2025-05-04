local function generic_status_colors()
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

local function generic_status_leds_working_visualisation()
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
