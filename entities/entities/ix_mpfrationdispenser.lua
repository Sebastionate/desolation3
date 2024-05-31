
AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "MPF Ration Dispenser"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.bNoPersist = true

ENT.Displays = {
	[1] = {"INSERT ID", color_white, true},
	[2] = {"CHECKING", Color(255, 200, 0)},
	[3] = {"DISPENSING", Color(0, 255, 0)},
	[4] = {"FREQ. LIMIT", Color(255, 0, 0)},
	[5] = {"WAIT", Color(255, 200, 0)},
	[6] = {"OFFLINE", Color(255, 0, 0), true},
	[7] = {"INSERT ID", Color(255, 0, 0)},
	[8] = {"PREPARING", Color(0, 255, 0)}
}

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Display")
	self:NetworkVar("Bool", 1, "Enabled")
end

local function GetClientCIDs(client)
	local cids = {}

	for _, data in pairs(client:GetCharacter():GetInventory():GetItems()) do
		if data.uniqueID == "cid" then
			table.insert(cids, data)
		elseif data.base == "base_bags" then
			for _, v in pairs(data:GetInventory():GetItems()) do
				if data.uniqueID == "cid" then
					table.insert(cids, v)
				end
			end
		end
	end

	return cids
end

if (SERVER) then
	util.AddNetworkString("ixUseRationDispenser")
	util.AddNetworkString("ixOpenRationDispenserMenu")

	function ENT:SpawnFunction(client, trace)
		local dispenser = ents.Create("ix_mpfrationdispenser")

		dispenser:SetPos(trace.HitPos)
		dispenser:SetAngles(trace.HitNormal:Angle())
		dispenser:Spawn()
		dispenser:Activate()
		dispenser:SetEnabled(true)

		Schema:SaveMPFRationDispensers()
		return dispenser
	end

	function ENT:Initialize()
		self:SetModel("models/props_junk/watermelon01.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:DrawShadow(false)
		self:SetUseType(SIMPLE_USE)
		self:SetDisplay(1)
		self:SetEnabled(true)

		self.dispenser = ents.Create("prop_dynamic")
		self.dispenser:SetModel("models/props_combine/combine_dispenser.mdl")
		self.dispenser:SetPos(self:GetPos())
		self.dispenser:SetAngles(self:GetAngles())
		self.dispenser:SetParent(self)
		self.dispenser:Spawn()
		self.dispenser:Activate()
		self:DeleteOnRemove(self.dispenser)

		local physics = self.dispenser:GetPhysicsObject()
		physics:EnableMotion(false)
		physics:Sleep()

		self.canUse = true
		self.nextUseTime = CurTime()
	end

	function ENT:SpawnRation(callback, releaseDelay, lp)
		releaseDelay = releaseDelay or 1.2

		--local rationType = "ration_metropolice"
		MPFRationType = MPFRationType or "ration_metropolice"
		
		--[[if character:GetClass() == CLASS_MPU then 
			rationType = "ration_metropolice"
		end

		if character:GetClass() == CLASS_EMP then 
			rationType = "ration_metropolice_elite"

		end]]

		local item = ix.item.Spawn(MPFRationType, self:GetPos(), function(itemTable, entity)
			if (callback) then
				callback(entity)
			end

			entity:SetMoveType(MOVETYPE_NONE)
			entity:SetNotSolid(true)
			entity:SetParent(self.dispenser, 1)
			--print(entity)

			timer.Simple(releaseDelay, function()
				local physics = entity:GetPhysicsObject()
				
				local pos = entity:GetPos()

				entity:SetMoveType(MOVETYPE_VPHYSICS)
				entity:SetNotSolid(false)
				entity:SetParent(nil)

				if (IsValid(physics)) then
					physics:EnableGravity(true)
					entity:SetPos(pos)
				end

				-- display cooldown notice
				timer.Simple(releaseDelay, function()
					self:SetDisplay(5)
				end)

				-- make dispenser usable
				timer.Simple(releaseDelay + 4, function()
					self.canUse = true
					self:SetDisplay(1)
				end)
			end)
		end, self:GetAngles())
	end

	function ENT:StartDispense(lp)
		self:SetDisplay(3)
		self:SpawnRation(function()
			self.dispenser:Fire("SetAnimation", "dispense_package")
			self:EmitSound("ambient/machines/combine_terminal_idle4.wav")
		end, nil, lp)
	end

	function ENT:DisplayError(id, length)
		id = id or 6
		length = length or 2

		self:SetDisplay(id)
		self:EmitSound("buttons/combine_button_locked.wav")
		self.canUse = false

		timer.Simple(length, function()
			self:SetDisplay(1)
			self.canUse = true
		end)
	end

	net.Receive("ixUseRationDispenser", function(len, ply)
		local itemID = net.ReadInt(32)
		local dispenser = net.ReadEntity()

		if !itemID then return end

		if !dispenser then return end

		if dispenser:GetClass() ~= "ix_mpfrationdispenser" then return end

		local item = ix.item.New("cid", itemID)

		if !item then return end

		dispenser:OnUse(ply, item)
	end)

	function ENT:OnUse(client, specifyCID)
		local playerCount = player.GetCount()
		if (!self.canUse or self.nextUseTime > CurTime()) then
			return
		end
		
		if (client:IsCombine()) and (client:Team() != FACTION_STAFF) then
			if (!self:GetEnabled()) or playerCount <= ix.config.Get("minimumPlayerRation") then
				self:DisplayError(6)
				return
			end
		end

		if not client:IsCombine() then
			self:DisplayError(7)
			return
		end

		local char = client:GetCharacter()

		if char:GetClass() == CLASS_MPU then 
			MPFRationType = "ration_metropolice"
		
		elseif char:GetClass() == CLASS_MPR then 
			MPFRationType = "ration_metropolice"
		
		elseif char:GetClass() == CLASS_EMP then 
			MPFRationType = "ration_metropolice_elite"
		
		elseif char:GetClass() == CLASS_EOW then 
			MPFRationType = "ration_metropolice_elite"

		elseif char:GetClass() == CLASS_OWS then 
			MPFRationType = "ration_metropolice_elite"

		elseif char:GetClass() == CLASS_OWR then 
			MPFRationType = "ration_metropolice_elite"

		end
		
		-- display checking message
		self.canUse = false
		self:SetDisplay(2)
		self:EmitSound("ambient/machines/combine_terminal_idle2.wav")

		-- check cid ration time and dispense if allowed
		timer.Simple(math.random(1.8, 2.2), function()
			if (char:GetData("nextRationTime", 0) < os.time()) then
				self:SetDisplay(8)
				self:EmitSound("ambient/machines/combine_terminal_idle3.wav")

				timer.Simple(10.2, function()
					self:StartDispense(points)
					char:SetData("nextRationTime", os.time() + ix.config.Get("rationIntervalMPF", 1))
				end)
			else
				self:DisplayError(4)
			end
		end)
	end

	function ENT:Use(client)
		self:OnUse(client)
	end

	function ENT:OnRemove()
		if (!ix.shuttingDown) then
			Schema:SaveMPFRationDispensers()
		end
	end
else
	surface.CreateFont("ixRationDispenser", {
		font = "Default",
		size = 32,
		antialias = false
	})

	net.Receive("ixOpenRationDispenserMenu", function()
		local dispenser = net.ReadEntity()

		local cids = GetClientCIDs(LocalPlayer())

		local menuOptions = {}

		for _, data in pairs(cids) do
			local cidText = "Blank CID"

			if data.data.id ~= nil
			and data.data.name ~= nil then
				cidText = data.data.name .. ", #" .. data.data.id
			end

			local num = 1

			// handle multiple citizen ids with same text bc ix.menu is gay
			while menuOptions[cidText] ~= nil do
				if num > 1 then
					// yea this is shitcode
					cidText = string.sub(cidText, 0, #cidText - 3 - #tostring(num - 1))
				end
				cidText = cidText .. " (" .. num .. ")"
				num = num + 1
			end

			menuOptions[cidText] = function()
				net.Start("ixUseRationDispenser")
				net.WriteInt(data.id, 32)
				net.WriteEntity(dispenser)
				net.SendToServer()
			end
		end

		local count = 0
		for _, __ in pairs(menuOptions) do
			count = count + 1
		end

		if count == 0 then
			self:ErrorNoise()
		elseif count == 1 then
			for _, v in pairs(menuOptions) do
				v()
				break
			end
		else
			ix.menu.Open(menuOptions, self)
		end
	end)

	function ENT:Draw()
		local position, angles = self:GetPos(), self:GetAngles()
		local display = self:GetEnabled() and self.Displays[self:GetDisplay()] or self.Displays[6]

		angles:RotateAroundAxis(angles:Forward(), 90)
		angles:RotateAroundAxis(angles:Right(), 270)

		cam.Start3D2D(position + self:GetForward() * 7.6 + self:GetRight()*  8.5 + self:GetUp() * 3, angles, 0.1)
			render.PushFilterMin(TEXFILTER.NONE)
			render.PushFilterMag(TEXFILTER.NONE)

			surface.SetDrawColor(color_black)
			surface.DrawRect(10, 16, 153, 40)

			surface.SetDrawColor(60, 60, 60)
			surface.DrawOutlinedRect(9, 16, 155, 40)

			local alpha = display[3] and 255 or math.abs(math.cos(RealTime() * 2) * 255)
			local color = ColorAlpha(display[2], alpha)

			draw.SimpleText(display[1], "ixRationDispenser", 86, 36, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			render.PopFilterMin()
			render.PopFilterMag()
		cam.End3D2D()
	end
end