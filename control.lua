--control.lua

require ("util")
require ("veteran-turrets")

script.on_init(function() InitMod() end)
script.on_load(function() OnLocalLoad()  end)

-- Turret Veterancy Script
local turretPairs = {}

script.on_event(defines.events.on_entity_died, function(event)  DidTurretDie(event.entity)  if event.cause ~= nil then DidTurretKill(event.cause) end end)
script.on_event(defines.events.on_player_mined_entity, function(event) OnRemoved(event.entity) end,  {{filter="turret"}} )
script.on_event(defines.events.on_robot_mined_entity, function(event) RemoveTurretListEntry(event.entity) end, {{filter="turret"}} )
script.on_event(defines.events.on_post_entity_died, function(eventinfo)  ReplaceTurretGhost(eventinfo)  end )
script.on_event(defines.events.on_built_entity, function(event)  ChangePastedTurret(event)  end,  {{filter="ghost", force="player"}} )
script.on_event(defines.events.on_player_created, function(event) OnPlayerCreated(event) end)

function InitMod() 
	storage.generator = game.create_random_generator()

	if game.forces["abandonments"] ~= nil then 
		game.forces["abandonments"].ai_controllable = false
		game.forces["abandonments"].custom_color = {0.6,0.6,0.6,1}
		else
		CreateForce("abandonments")
	end
	
	OnLocalLoad()
end

function CreateForce(force)
f = game.create_force(force)
f.custom_color = {0.6,0.6,0.6,1}
f.ai_controllable = false
end

-- function OnForceCreated(event) 
-- event.force.ai_controllable = false
-- event.force.custom_color = {0.6,0.6,0.6,1}
-- end

function GetTargets(entity)
	local targets = {}
	local index = 0
	while true do
	  index = index + 1
	  local success, target = pcall(entity.get_priority_target, index)
	  if not success then break end
	  table.insert(targets, target)
	end
	return targets
end

function SetTargets(targets, entity)
	 for i, v in pairs (targets) do
		entity.set_priority_target(i,v)
	 end
end

-- on_built_entity
function ChangePastedTurret(event) 
--game.print("ChangePastedTurret")
--game.print( "Entity:" .. serpent.block(event.entity.ghost_prototype))

	if (IsTurret(event.entity.ghost_prototype)) then
		local targets = GetTargets(event.entity)
		local ignoretargets = event.entity.ignore_unprioritised_targets
		local turretpasted = event.entity.surface.create_entity
		{							
		  name = "entity-ghost",
		  inner_name = event.entity.ghost_prototype.mineable_properties.products[1].name,
		  quality = event.entity.quality,
		  position = event.entity.position,
		  direction = event.entity.direction,
		  expires = false,
		  force = "player"
		}
		event.entity.destroy()
		
		SetTargets(targets,turretpasted)
		turretpasted.ignore_unprioritised_targets = ignoretargets
	end
end

-- on_post_entity_died
function ReplaceTurretGhost(eventinfo) 
if (IsTurret(eventinfo.prototype)) then
	if eventinfo.ghost ~= nil then -- Check to see if ghosts are being created first!
		local targets = GetTargets(eventinfo.ghost)
		local ignoretargets = eventinfo.ghost.ignore_unprioritised_targets
		local turretghost = eventinfo.ghost.surface.create_entity
		{							
		  name = "entity-ghost",
		  inner_name = eventinfo.prototype.mineable_properties.products[1].name,
		  quality = eventinfo.quality,
		  position = eventinfo.position,
		  direction = eventinfo.ghost.direction,
		  --ignore_unprioritised_targets = event.entity.ignore_unprioritised_targets,
		  expires = true,
		  force = "player"
		}
		eventinfo.ghost.destroy()
		
		SetTargets(targets,turretghost)
		turretghost.ignore_unprioritised_targets = ignoretargets
	end
end

end

function IsTurret(entity)
	if entity ~= nil then
	-- game.print("isEntity!")
	    for turretgroup, v in pairs (turretVetGroupings) do
			-- game.print("isTurret!")
			if string.find(entity.name, turretgroup, 1, true  ) ~= nil then 
				return true
			end
		end	    
	end
	return false
end



local shipStartPieces = {"crash-site-lab-repaired","crash-site-assembling-machine-1-repaired","crash-site-assembling-machine-2-repaired","crash-site-generator"}
local shipElectricPole = "crash-site-electric-pole"

function PlaceShipParts() 
ship = FindStartShip()
thisPosition = {math.random(-4,4),math.random(-4,4)}
	if ship then
		for k, name in pairs (shipStartPieces) do
			thisPosition = game.surfaces[1].find_non_colliding_position( name, thisPosition, 7, 3, true )
			game.surfaces[1].create_entity{ position = thisPosition, name = name, force = "player" } 
			if (k ~= #shipStartPieces) then
			thisPosition = game.surfaces[1].find_non_colliding_position( name, thisPosition, 5, 2, true )
			game.surfaces[1].create_entity{ position = thisPosition, name = shipElectricPole, force = "player" } 
			end
		end
	end
end

function FindStartShip() 
local ship = game.surfaces[1].find_entities_filtered{name="crash-site-spaceship"}
	if ship then
	return ship
	else 
	return nil
	end
end


local extra_loot_ship = nil
local extra_loot_large_wreck = nil
local extra_loot_medium_wreck = nil
if settings.startup["settings-crashsite-bonus"].value == "more" then
	extra_loot_ship = {
		{name="med-pack", count=4},
		{name="repair-pack", count=10},
		{name="submachine-gun", count=1},
		{name="light-armor", count=1},
		{name="firearm-magazine", count=40},
	}
	extra_loot_large_wreck = {
		{name="iron-plate", count=20},
		{name="iron-gear-wheel", count=10},
	}
	extra_loot_medium_wreck = {
		{name="iron-plate", count=5},
	}
elseif settings.startup["settings-crashsite-bonus"].value == "extra" then
extra_loot_ship = {
		{name="med-pack", count=10},
		{name="repair-pack", count=40},
		{name="submachine-gun", count=1},
		{name="firearm-magazine", count=40},
		{name="piercing-rounds-magazine", count=20},
		{name="heavy-armor", count=1},
		{name="defender-capsule", count=4},
		
	}
	extra_loot_large_wreck = {
		{name="iron-plate", count=80},
		{name="copper-plate", count=20},
		{name="steel-plate", count=10},
	}
	extra_loot_medium_wreck = {
		{name="iron-plate", count=15},
		{name="iron-gear-wheel", count=30},
	}
end

function InsertGoodies(objects, items) 
--local ship = game.surfaces[1].find_entities_filtered{name="crash-site-spaceship"}
	if objects and items then
		for i,v in ipairs(objects) do
			InsertItemsStack(items, v)
		end
	end
--local ship = game.surfaces[1].find_entities_filtered{name="crash-site-spaceship-wreck-big-1"}	
end

function InsertItemsStack(items, object) 
	for i,v in ipairs(items) do
		object.insert(v)
	end
end







function OnPlayerCreated()
	if ( remote.interfaces["freeplay"] and  settings.startup["settings-crashsite"].value == true and storage.crashsiteplaced == nil
	 ) then
		PlaceShipParts() 
		if settings.startup["settings-crashsite-bonus"].value ~= "normal" then
			InsertGoodies(game.surfaces[1].find_entities_filtered{name="crash-site-spaceship"},extra_loot_ship)
			InsertGoodies(game.surfaces[1].find_entities_filtered{name="crash-site-spaceship-wreck-big-1"},extra_loot_large_wreck)
			InsertGoodies(game.surfaces[1].find_entities_filtered{name="crash-site-spaceship-wreck-big-2"},extra_loot_large_wreck)
			InsertGoodies(game.surfaces[1].find_entities_filtered{name="crash-site-spaceship-wreck-medium-1"},extra_loot_medium_wreck)
			InsertGoodies(game.surfaces[1].find_entities_filtered{name="crash-site-spaceship-wreck-medium-2"},extra_loot_medium_wreck)
			InsertGoodies(game.surfaces[1].find_entities_filtered{name="crash-site-spaceship-wreck-medium-3"},extra_loot_medium_wreck)
		end
		storage.crashsiteplaced = true
	end	
end

function OnLocalLoad()
	if storage.turrets == nil then
	-- maybe init turrets pairs is a method for all places to call? 
	else
	turretPairs = storage.turrets
	end
end


function DidTurretDie(entity)
	if entity ~= nil then
	    for turretgroup, v in pairs (turretVetGroupings) do
			if string.find(entity.name, turretgroup, 1, true  ) ~= nil then 
				entity.kills = 0
				entity.damage_dealt = 0
				local num = entity.unit_number
				if storage.turrets ~= nil then
				
					if storage.turrets[num] ~= nil then
						storage.turrets[num][2].destroy()
						table.remove(storage.turrets,num)	
					end	
				end
		
			end
		end	    
	end
end


function OnRemoved(entity)
	if entity ~= nil then
		RemoveOldTurret(entity)
	end
end

function RemoveIcon(turretEntity)
	for _, entity in pairs(glob.entities) do
		local newEntity = ReplaceSingleEntity(entity, newName)
		if newEntity then
			table.insert(newEntities, newEntity)
		end
	end
end

local function escapeHyphens(str) 
  return str:gsub("%-", "%%-") 
end
	
function DidTurretKill(entity)

    for turretgroup, v in pairs (turretVetGroupings) do

		if string.find(entity.name, turretgroup, 1, true  ) ~= nil then 

			for index, turretvet in pairs (v) do

			-- if this is the original turret (not upgraded)
				if string.find(turretgroup, entity.name, 1, true  ) ~= nil and entity.kills >= turretKillLevels[1] then

					UpgradeTurret(entity, v[1] ,turretVetIcons[1])
					return
 
				end
			-- if it's already upgraded then
				if v[index+1] ~= nil and string.find(v[index], entity.name, 1, true  ) ~= nil and turretKillLevels[index+1] ~= nil and entity.kills >= turretKillLevels[index+1] then
					UpgradeTurret(entity, v[index+1] ,turretVetIcons[index+1])
					return
				end
			end
		end
	end

end

	
function UpgradeTurret(turret, newName, icon)
	
	-- Don't replace a dead or removed turret.	
	if not turret.valid then
		return false
	end

	-- init storage turrets tracking table
	if storage.turrets == nil then
		storage.turrets = {}
		-- created new storage turrets if none exists
	end
	
	-- Get relevant stats of the turret.
	local ammo = GetAmmo(turret)
	local healthPercent = turret.health / prototypes.entity[turret.name].get_max_health()
	local kills = turret.kills
	local damage_dealt = turret.damage_dealt 
	local turretSurface = turret.surface
	local turretPosition = turret.position
	local turretForce = turret.force
	local turretDirection = turret.direction
	local turretQuality = turret.quality
	local targets = GetTargets(turret)
	local ignoretargets = turret.ignore_unprioritised_targets
		 
	
	RemoveOldTurret(turret) -- This fixed the issue of flame turrets not working correctly by removing the old turret before making the new one.
	
	-- Create a new turret and copy in the stats of the old one.
	local newTurret = turretSurface.create_entity{position=turretPosition, quality =turretQuality, name=newName, force = turretForce, direction=turretDirection, target=turretPosition, fast_replace=true}
	newTurret.kills = kills
	newTurret.damage_dealt = damage_dealt
	
	SetTargets(targets,newTurret)
	newTurret.ignore_unprioritised_targets = ignoretargets
	
	-- Create the veterancy icon at the Bottom Right of the turrets bounding box
	local newIcon = newTurret.surface.create_entity{position = BoundingBoxBottomRightPosition(newTurret), name = icon}
	
	-- Set relevant stats on the new turret.
	newTurret.health = healthPercent * prototypes.entity[newTurret.name].get_max_health()
	if ammo then
		--newTurret.insert(ammo)
		InsertAmmo(newTurret, ammo)
	end
	
	-- Create flying text to mark veterancy
	
	for i,v in pairs(game.players) do
    v.create_local_flying_text{text={"factorioplus-text.veterancy-bonus"},position = newTurret.position, create_at_cursor = false, color = { 1, 0.85 ,0, 1} }
	end
	
	-- newTurret.surface.create_entity{position = newTurret.position, name = "flying-text-veterancy", text = "+debugtext", color = { 1, 0.85 ,0, 1}  }
	-- flyText.text = {"factorioplus-text.veterancy-bonus"}
	
	--local flyText = newTurret.surface.create_entity{position = newTurret.position, name = "flying-text-veterancy", text = "+debugtext", color = { 1, 0.85 ,0, 1}  }
	--flyText.text = {"factorioplus-text.veterancy-bonus"}
	
	-- Create a k,v pair of the turret entity and its associated icon entity
	local num = newTurret.unit_number
	local turretPair = {newTurret, newIcon}
	
	-- add the pair of turrets and their icons to the turret tracking table
	if storage.turrets[num] == nil then
		table.insert (storage.turrets, num, turretPair)
		-- inserted new turret into the storage tracking list
	end
	
	-- RemoveOldTurret(turret)

end

-- If a veteran turret is mined, it needs to be removed from the list,
function RemoveTurretListEntry(turretEntity)
local num = turretEntity.unit_number
	if storage.turrets ~= nil then
		if storage.turrets[num] ~= nil then
			-- destroy the turrets vet icon
			storage.turrets[num][2].destroy()
			-- and remove it from the tracking table
			table.remove(storage.turrets,num)
			return
		end
	end	
end

function RemoveOldTurret(turretEntity)
local num = turretEntity.unit_number
	if storage.turrets ~= nil then
		if storage.turrets[num] ~= nil then
			-- destroy old veteran turret[1] and icon[2]
			storage.turrets[num][1].destroy()
			storage.turrets[num][2].destroy()
			-- remove from storage table tracking
			table.remove(storage.turrets,num)
			return
		end
		-- destroy old turret if it's basic ass.
		turretEntity.destroy()	
	end
		
end
 
function BoundingBoxBottomRightPosition(entity)
  return entity.bounding_box.right_bottom
end


function GetAmmo(turret)
	--local inv = turret.get_inventory(1)
	local inv = turret.get_inventory(1)
	
	if inv == nil then
	return false
	else 
	return inv.get_contents()
	end
	
	-- for name, count in pairs(inv.get_contents()) do
		-- return {name=name, count=count}
	-- end
	return false
end

function InsertAmmo(turret, ammo)
--game.print( "Insert Ammo")
--game.print( "ammo:" .. serpent.block(ammo))

for i,v in pairs(ammo) do
	--game.print( "ammo:" .. i .. serpent.block(v))

	turret.insert({name=v.name, count=v.count, quality=v.quality})
 end

end