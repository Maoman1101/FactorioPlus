-- This exists already in the game 

if (mods["space-age"]) then
	-- Spoilage percent multiplier
-- data:extend({
	-- {
        -- type = "int-setting",
        -- name = "settings-spoilage-multiplier",
        -- setting_type = "startup",
		-- allowed_values = {50, 100, 200, 500, 1000},
        -- default_value = 100,
    -- },
-- })
else

--	Rocket Recipe
data:extend({
	{
        type = "int-setting",
        name = "settings-rocket-recipe",
        setting_type = "startup",
        allowed_values = {5, 10, 20, 30, 40, 50, 100, 250, 500, 1000},
        default_value = 10,
    },
	{
        type = "int-setting",
        name = "settings-rocket-recipe-energy",
        setting_type = "startup",
		allowed_values = {1, 2, 3, 4, 5, 10, 30, 60, 300, 600},
        default_value = 3,
    },
})
end


data:extend({
	{
		type = "int-setting",
		name = "settings-friendlyfire-percent",
		setting_type = "startup",
		allowed_values = {0, 25, 50, 100},
		default_value = 25,
    },
    {
        type = "bool-setting",
        name = "settings-crashsite",
        setting_type = "startup",
        default_value = true
    },
	{
        type = "string-setting",
        name = "settings-crashsite-bonus",
        setting_type = "startup",
		default_value = "normal",
		allowed_values = {"normal", "more", "extra"},
    },
	-- Biter Stuff
	{
		type = "int-setting",
		name = "settings-chunks-probability",
		setting_type = "startup",
		allowed_values = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100},
		default_value = 50,
    },
	{
		type = "int-setting",
		name = "settings-chunks-multiplier",
		setting_type = "startup",
		allowed_values = {1, 2, 3, 4, 5, 10},
		default_value = 1,
    },
	-- Enemies
	{
        type = "string-setting",
        name = "settings-enemy-health",
        setting_type = "startup",
		default_value = "normal",
		allowed_values = {"easy", "normal", "hard", "extreme", "insane"},
    },
	-- Tech
	{
        type = "string-setting",
        name = "settings-recipe-cost",
        setting_type = "startup",
		default_value = "normal",
		allowed_values = {"easy", "normal", "hard", "extreme"},
    },
	-- Warehouse Stuff
	{
		type = "bool-setting",
		name = "settings-warehouse-abandonments",
		setting_type = "startup",
		default_value = true,
    },
	{
		type = "string-setting",
		name = "settings-warehouse-spacing",
		setting_type = "startup",
		allowed_values = { "dense", "common" , "normal", "uncommon", "sparse", "rare"},
		default_value = "normal",
		-- { 14, 18, 22, 26, 30}
    },
	{
		type = "int-setting",
		name = "settings-warehouse-scaling",
		setting_type = "startup",
		allowed_values = {50, 75, 100, 125, 150, 200, 300, 400, 500, 750, 1000},
		default_value = 100,
    },
	{
		type = "bool-setting",
		name = "settings-warehouse-barren",
		setting_type = "startup",
		default_value = true,
    },
	   {
        type = "string-setting",
        name = "settings-character-selection",
        setting_type = "startup",
		default_value = "default",
		allowed_values = {"default","kobold","nimble","constructor","soldier","hauler","tank"},
    },
	-- Loaders
	{
        type = "bool-setting",
        name = "settings-loaders-active",
        setting_type = "startup",
		default_value = true,
    },
	{
        type = "string-setting",
        name = "settings-loaders-cost",
        setting_type = "startup",
		default_value = "normal",
		allowed_values = {"normal","expensive"},
    },
	-- Blanket changes
	{
        type = "string-setting",
        name = "settings-status-panels",
        setting_type = "startup",
		default_value = "electric-only",
		allowed_values = {"none","electric-only","all"},
    },
	-- World Settings
	{
        type = "string-setting",
        name = "settings-world-daynightcycle",
        setting_type = "startup",
		default_value = "normal",
		allowed_values = {"short", "normal", "long"},
    },
})