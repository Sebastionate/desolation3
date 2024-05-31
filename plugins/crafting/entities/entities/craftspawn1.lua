AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "craftspawn_base"
ENT.PrintName = "Common Items" -- change to item rarity or types
ENT.Category = "Crafting"
ENT.Spawnable = true
ENT.AdminOnly = true

-- item types to spawn

ENT.ItemTypes = {
	"aa",
    "casing",
    "civcb",
    "clothp",
    "medtrash",
    "nuts",
    "piping",
    "plasticp",
    "steelp",
    "ducttape",
    "woodp",
    "woods",
    "ledbk",
    "bolts",
    "powerbank",
    "wires",
    "gunpowder",
    "plastics",
    "cloth",
    "shell"
}

-- ?? minutes
ENT.SpawnInterval = 1800
-- ??% chance to spawn
ENT.SpawnChance = 0.8
-- 30% chance to spawn on map start
ENT.SpawnChanceServerStart = 0
-- don't spawn items if other items in ItemTypes are with in *** hammer units
ENT.DontSpawnRange = 450
ENT.DistanceAwayMin = 20
ENT.DistanceAwayMax = 40