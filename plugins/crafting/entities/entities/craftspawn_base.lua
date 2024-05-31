AddCSLuaFile()

DEFINE_BASECLASS("base_anim")

ENT.Type = "anim"
ENT.PrintName = "Item Spawner (base)" -- change to item rarity or types
ENT.Category = "Crafting"
ENT.Spawnable = false
ENT.AdminOnly = false

-- item types to spawn

ENT.ItemTypes = {}

ENT.SpawnInterval = 600
ENT.SpawnChance = 0
ENT.SpawnChanceServerStart = 0
ENT.DontSpawnRange = 0
ENT.DistanceAwayMin = 0
ENT.DistanceAwayMax = 0

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:DrawShadow(false)
		self:SetSolid(SOLID_BBOX)
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
		--self:PhysicsInit(SOLID_NONE)

		local enableSpawning = true

		if enableSpawning then
			self.timerName = "spawntimer_" .. tostring(math.random(99999))
			if not self.timer then 
				self.timer = timer.Create(self.timerName, self.SpawnInterval, 0, function()
					self:SpawnRandomItem()
				end)
			end
		end

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end
	end

	--cleanup.Add(player, "Item Spawners (Common)", self)

	self:SetCustomCollisionCheck(true)
end

function ENT:RenderOverride()
	if (LocalPlayer():IsAdmin() and LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP) then
		self:DrawModel()
	else
		self:DestroyShadow()
	end
end

if SERVER then
	function ENT:AreSimilarItemsNearby()
		local ents = ents.FindInSphere( self:GetPos(), self.DontSpawnRange )
		for _, ent in pairs(ents) do
			if (ent:GetClass() == "ix_item") then
				local data = ent:GetItemTable()
				for _, v in pairs(self.ItemTypes) do
					if (v == data.uniqueID) then
						return true
					end
				end
			end
		end

		return false
	end

	function ENT:SpawnRandomItem(onCreate)
		local playerCount = player.GetCount()
		if playerCount <= ix.config.Get("minimumPlayers") then return end

		local chance = onCreate and self.SpawnChanceServerStart or self.SpawnChance

		if math.random() > chance then
			return false
		end

		if self:AreSimilarItemsNearby() then
			print("[crafting] similar items found nearby, skipping item spawn.")
			return false
		end

		local itemType = self.ItemTypes[math.random(#self.ItemTypes)]

		local entPos = self:GetPos()
		local pos = self:GetPos()

		if math.random() > 0.5 then
			local x = (entPos.x + math.random() + math.random(self.DistanceAwayMin, self.DistanceAwayMax) - 1.0)
			local y = (entPos.y + math.random() + math.random(self.DistanceAwayMin, self.DistanceAwayMax) - 1.0)
			pos = Vector(x, y, pos.z)
		else
			local x = (entPos.x - math.random() + math.random(self.DistanceAwayMin, self.DistanceAwayMax) - 1.0)
			local y = (entPos.y - math.random() + math.random(self.DistanceAwayMin, self.DistanceAwayMax) - 1.0)
			pos = Vector(x, y, pos.z)
		end

		ix.item.Spawn(itemType, pos + Vector(0, 0, 20), function(item, ent)
			ent:SetCustomCollisionCheck(true)
		end)

		print("[crafting] spawned a " .. itemType .. ".")

		return true
	end
end



--[[hook.Add("ShouldCollide", "itemSpawnerCollision", function(ent1, ent2)
	--if string.find(ent1:GetClass(), "craftspawn") and ent2:GetClass() == "ix_item" then return false end
	--if string.find(ent2:GetClass(), "craftspawn") and ent1:GetClass() == "ix_item" then return false end
	if string.find(ent1:GetClass(), "craftspawn") and ent2:IsPlayer() then return false end
	if string.find(ent2:GetClass(), "craftspawn") and ent1:IsPlayer() then return false end

	return true
end)]]

--[[hook.Add("PlayerSpawn", "itemSpawnerCleanupGroup", function(player)
	cleanup.Add( player, "Item Spawners (Common)", "craftspawn1" )
	cleanup.Register("Item Spawners (Common)")
end)]]