
AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Forcefield"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.PhysgunDisabled = true
ENT.bNoPersist = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Mode")
	self:NetworkVar("Entity", 0, "Dummy")
end

local MODE_ALLOW_ALL = 1
local MODE_ALLOW_CID = 2
local MODE_ALLOW_NONE = 3

if (SERVER) then
	function ENT:SpawnFunction(client, trace)
		local angles = (client:GetPos() - trace.HitPos):Angle()
		angles.p = 0
		angles.r = 0
		angles:RotateAroundAxis(angles:Up(), 270)

		local entity = ents.Create("ix_forcefield")
		entity:SetPos(trace.HitPos + Vector(0, 0, 40))
		entity:SetAngles(angles:SnapTo("y", 90))
		entity:Spawn()
		entity:Activate()

		Schema:SaveForceFields()
		return entity
	end

	function ENT:Initialize()
		self:SetModel("models/props_combine/combine_fence01b.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:PhysicsInit(SOLID_VPHYSICS)

		local data = {}
			data.start = self:GetPos() + self:GetRight() * -16
			data.endpos = self:GetPos() + self:GetRight() * -480
			data.filter = self
		local trace = util.TraceLine(data)

		local angles = self:GetAngles()
		angles:RotateAroundAxis(angles:Up(), 90)

		self.dummy = ents.Create("prop_physics")
		self.dummy:SetModel("models/props_combine/combine_fence01a.mdl")
		self.dummy:SetPos(trace.HitPos)
		self.dummy:SetAngles(self:GetAngles())
		self.dummy:Spawn()
		self.dummy.PhysgunDisabled = true
		self:DeleteOnRemove(self.dummy)

		local verts = {
			{pos = Vector(0, 0, -25)},
			{pos = Vector(0, 0, 150)},
			{pos = self:WorldToLocal(self.dummy:GetPos()) + Vector(0, 0, 150)},
			{pos = self:WorldToLocal(self.dummy:GetPos()) + Vector(0, 0, 150)},
			{pos = self:WorldToLocal(self.dummy:GetPos()) - Vector(0, 0, 25)},
			{pos = Vector(0, 0, -25)}
		}

		self:PhysicsFromMesh(verts)

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end

		self:SetCustomCollisionCheck(true)
		self:EnableCustomCollisions(true)
		self:SetDummy(self.dummy)

		physObj = self.dummy:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end

		self:SetMoveType(MOVETYPE_NOCLIP)
		self:SetMoveType(MOVETYPE_PUSH)
		self:MakePhysicsObjectAShadow()
		self:SetMode(MODE_ALLOW_ALL)
	end

	function ENT:StartTouch(entity)
		if (!self.buzzer) then
			self.buzzer = CreateSound(entity, "ambient/machines/combine_shield_touch_loop1.wav")
			self.buzzer:Play()
			self.buzzer:ChangeVolume(0.8, 0)
		else
			self.buzzer:ChangeVolume(0.8, 0.5)
			self.buzzer:Play()
		end

		self.entities = (self.entities or 0) + 1
	end

	function ENT:EndTouch(entity)
		self.entities = math.max((self.entities or 0) - 1, 0)

		if (self.buzzer and self.entities == 0) then
			self.buzzer:FadeOut(0.5)
		end
	end

	function ENT:OnRemove()
		if (self.buzzer) then
			self.buzzer:Stop()
			self.buzzer = nil
		end

		if (!ix.shuttingDown and !self.ixIsSafe) then
			Schema:SaveForceFields()
		end
	end

	local MODES = {
		{
			function(client)
				return false
			end,
			"Off."
		},
		{
			function(client)
				local character = client:GetCharacter()

				if (character and character:GetInventory() and !character:GetInventory():HasItem("cid")) then
					return true
				else
					return false
				end
			end,
			"Only allow with valid CID."
		},
		{
			function(client)
				local character = client:GetCharacter()
				local inventory = character:GetInventory()
				local cid = inventory:HasItem("cid")
				local IsLoyalist = cid and cid:GetData("loyalty") and cid:GetData("loyalty").points >= 10
			if (character and character:GetInventory() and !IsLoyalist or !cid) then
				return true
			else
				return false
			end
			end,
			"Only allow loyalists."
		},
		{
			function(client)
				return true
			end,
			"Never allow citizens."
		}
	}

	function ENT:Use(activator)
		if ((self.nextUse or 0) < CurTime()) then
			self.nextUse = CurTime() + 1.5
		else
			return
		end

		if (activator:IsCombine() or activator:Team() == FACTION_STAFF) then
			self:SetMode(self:GetMode() + 1)

			if (self:GetMode() > #MODES) then
				self:SetMode(1)

				self:SetSkin(1)
				self.dummy:SetSkin(1)
				self:EmitSound("npc/turret_floor/die.wav")
			else
				self:SetSkin(0)
				self.dummy:SetSkin(0)
			end

			for _, entity in ipairs(ents.FindInSphere(self:GetPos(), ix.config.Get("chatRange", 280))) do
				if entity:IsValid() and entity:IsPlayer() and entity != activator then
					entity:Freeze(true)
					entity:Notify("A forcefield is opening nearby, please wait!")

					timer.Simple(3, function()
						entity:Freeze(false)
					end)
				end
			end

			self:EmitSound("buttons/combine_button5.wav", 140, 100 + (self:GetMode() - 1) * 15)
			activator:ChatPrint("Changed barrier mode to: "..MODES[self:GetMode()][2])

			Schema:SaveForceFields()
		else
			self:EmitSound("buttons/combine_button3.wav")
		end
	end

	hook.Add("ShouldCollide", "ix_forcefields", function(a, b)
		if a:GetClass() == "ix_forcefield" then
			if a:GetMode() == 1 then return false end
		elseif b:GetClass() == "ix_forcefield" then
			if b:GetMode() == 1 then return false end
		end

		local client
		local entity

		if (a:IsPlayer()) then
			client = a
			entity = b
		elseif (b:IsPlayer()) then
			client = b
			entity = a
		end

		if (IsValid(entity) and entity:GetClass() == "ix_forcefield") then
			if (IsValid(client)) then
				if (client:IsCombine() or client:Team() == FACTION_DISTRICTADMINISTRATOR or client:Team() == FACTION_DISPATCH) then
					return false
				end

				local mode = entity:GetMode() or 1

				return istable(MODES[mode]) and MODES[mode][1](client)
			else
				return entity:GetMode() != 4
			end
		end

		if (a:GetClass() != "ix_forcefield" && b:GetClass() == "ix_forcefield") then
			client = a
			entity = b
		elseif (a:GetClass() == "ix_forcefield" && b:GetClass() != "ix_forcefield") then
			client = b
			entity = a
		end

		if (IsValid(entity) and entity:GetClass() == "ix_forcefield") then
			--if (client:GetClass() == "prop_ragdoll") then
				if client:GetClass() == "pill_ent_phys"
				or client:GetClass() == "prop_vehicle_prisoner_pod"
				or (client:IsVehicle() and client.VehicleName == "sim_fphys_combineapc_armed") then
					return false
				end
				if (client:GetClass() == "prop_ragdoll" and client.ixPlayer == nil or entity:GetMode() == MODE_ALLOW_ALL) then
					return false
				end
				if IsValid(client.ixHeldOwner) and (client.ixHeldOwner:IsCombine()) then
					return false
				end
			--end
		end
	end)
else
	local SHIELD_MATERIAL = ix.util.GetMaterial("effects/combineshield/comshieldwall3")

	function ENT:Initialize()
		local data = {}
			data.start = self:GetPos() + self:GetRight()*-16
			data.endpos = self:GetPos() + self:GetRight()*-480
			data.filter = self
		local trace = util.TraceLine(data)

		self:EnableCustomCollisions(true)
		self:PhysicsInitConvex({
			vector_origin,
			Vector(0, 0, 150),
			trace.HitPos + Vector(0, 0, 150),
			trace.HitPos
		})
	end

	function ENT:Draw()
		self:DrawModel()

		if (self:GetMode() == 1) then
			return
		end

		local angles = self:GetAngles()
		local matrix = Matrix()
		matrix:Translate(self:GetPos() + self:GetUp() * -40)
		matrix:Rotate(angles)

		render.SetMaterial(SHIELD_MATERIAL)

		local dummy = self:GetDummy()

		if (IsValid(dummy)) then
			local vertex = self:WorldToLocal(dummy:GetPos())
			self:SetRenderBounds(vector_origin, vertex + self:GetUp() * 150)

			cam.PushModelMatrix(matrix)
				self:DrawShield(vertex)
			cam.PopModelMatrix()

			matrix:Translate(vertex)
			matrix:Rotate(Angle(0, 180, 0))

			cam.PushModelMatrix(matrix)
				self:DrawShield(vertex)
			cam.PopModelMatrix()
		end
	end

	function ENT:DrawShield(vertex)
		mesh.Begin(MATERIAL_QUADS, 1)
			mesh.Position(vector_origin)
			mesh.TexCoord(0, 0, 0)
			mesh.AdvanceVertex()

			mesh.Position(self:GetUp() * 190)
			mesh.TexCoord(0, 0, 3)
			mesh.AdvanceVertex()

			mesh.Position(vertex + self:GetUp() * 190)
			mesh.TexCoord(0, 3, 3)
			mesh.AdvanceVertex()

			mesh.Position(vertex)
			mesh.TexCoord(0, 3, 0)
			mesh.AdvanceVertex()
		mesh.End()
	end
end
