AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "craftspawn_base"
ENT.PrintName = "Weapon Crafts" -- change to item rarity or types
ENT.Category = "Crafting"
ENT.Spawnable = true
ENT.AdminOnly = true

-- item types to spawn

ENT.ItemTypes = {
	"shell",
	"casing",
	"ar2cart",
	"gunparts",
	"gunpowder"
}


ENT.SpawnInterval = 3000
-- ??% chance to spawn
ENT.SpawnChance = 0.8
-- ??% chance to spawn on map start
ENT.SpawnChanceServerStart = 0.0
-- don't spawn items if other items in ItemTypes are with in *** hammer units
ENT.DontSpawnRange = 450
ENT.DistanceAwayMin = 20
ENT.DistanceAwayMax = 40