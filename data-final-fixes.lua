for name, tile in pairs(data.raw["tile"]) do
  if tile.vehicle_friction_modifier and not tile.name:find("concrete") and not tile.name:find("stone-path") and not tile.name:find("tarmac") then
    tile.vehicle_friction_modifier = tile.vehicle_friction_modifier * 3
  end
end
