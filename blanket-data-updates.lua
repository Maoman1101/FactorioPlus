require ("__factorioplus__.util-building-additions")

--Add a status panel to entities.

apply_generic_workingvis_to_all("assembling-machine")
apply_generic_workingvis_to_all("furnace")
apply_generic_workingvis_to_all("mining-drill")


-- local function apply_spoilage_scale (entity_type)
	-- local _scale = settings.startup["settings-spoilage-multiplier"].value / 100
	-- for i, v in pairs(data.raw[entity_type]) do
		-- if (v.spoil_ticks) then
			-- v.spoil_ticks = v.spoil_ticks * _scale
		-- end
	-- end	
-- end

-- if (mods["space-age"]) then

-- -- find entities that has spoilage and scale it up.
	-- apply_spoilage_scale("tool")
	-- apply_spoilage_scale("capsule")	
	-- apply_spoilage_scale("item")	

-- end