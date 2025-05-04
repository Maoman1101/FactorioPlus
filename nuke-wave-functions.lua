local nwf = {}

nwf.func_atomic_bomb_wave = function(n, scale, dam)
return {
    type = "projectile",
    name = n,
    flags = {"not-on-map"},
    acceleration = 0,
    speed_modifier = { 1.0 * scale, 0.707 * scale },
    action =
    {
      {
        type = "area",
        radius = 3 * scale,
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
            damage = {amount = dam, type = "explosion"}
          }
        }
      }
    },
    animation = nil,
    shadow = nil
  }
 end

return nwf