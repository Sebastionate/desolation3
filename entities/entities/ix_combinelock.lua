AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Combine Lock"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.bNoPersist = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Locked")
	self:NetworkVar("Bool", 1, "DisplayError")
	self:NetworkVar("Bool", 2, "CWUAccess")
	self:NetworkVar("Bool", 3, "LoyalistAccess")

	if (SERVER) then
		self:NetworkVarNotify("Locked", self.OnLockChanged)
	end
end

properties.Add( "cwuaccess_enable", {
	MenuLabel = "Enable CWU Access",
	Order = 999,
	MenuIcon = "icon16/accept.png",

	Filter = function( self, ent, ply )
		if ( ent:GetClass() != "ix_combinelock" ) then return false end
		if ( ent:GetCWUAccess() == true ) then return false end
		if ( ent:GetLoyalistAccess() == true ) then return false end
		if ( !ply:IsAdmin() ) then return false end

		return true
	end,
	Action = function( self, ent )

		self:MsgStart()
			net.WriteEntity( ent )
		self:MsgEnd()

	end,
	Receive = function( self, length, player )
		local ent = net.ReadEntity()
		if ( !self:Filter( ent, player ) ) then return end

		ent:SetCWUAccess(true)
	end
} )

properties.Add( "cwuaccess_disable", {
	MenuLabel = "Disable CWU Access",
	Order = 999,
	MenuIcon = "icon16/cancel.png",

	Filter = function( self, ent, ply )
		if ( ent:GetClass() != "ix_combinelock" ) then return false end
		if ( ent:GetCWUAccess() == false ) then return false end
		if ( !ply:IsAdmin() ) then return false end

		return true
	end,
	Action = function( self, ent )

		self:MsgStart()
			net.WriteEntity( ent )
		self:MsgEnd()

	end,
	Receive = function( self, length, player )
		local ent = net.ReadEntity()
		if ( !self:Filter( ent, player ) ) then return end

		ent:SetCWUAccess(false)
	end
} )

properties.Add( "loyalistaccess_enable", {
	MenuLabel = "Enable Loyalist Access",
	Order = 999,
	MenuIcon = "icon16/accept.png",

	Filter = function( self, ent, ply )
		if ( ent:GetClass() != "ix_combinelock" ) then return false end
		if ( ent:GetLoyalistAccess() == true ) then return false end
		if ( ent:GetCWUAccess() == true ) then return false end
		if ( !ply:IsAdmin() ) then return false end

		return true
	end,
	Action = function( self, ent )

		self:MsgStart()
			net.WriteEntity( ent )
		self:MsgEnd()

	end,
	Receive = function( self, length, player )
		local ent = net.ReadEntity()
		if ( !self:Filter( ent, player ) ) then return end

		ent:SetLoyalistAccess(true)
	end
} )

properties.Add( "loyalistaccess_disable", {
	MenuLabel = "Disable Loyalist Access",
	Order = 999,
	MenuIcon = "icon16/cancel.png",

	Filter = function( self, ent, ply )
		if ( ent:GetClass() != "ix_combinelock" ) then return false end
		if ( ent:GetLoyalistAccess() == false ) then return false end
		if ( !ply:IsAdmin() ) then return false end

		return true
	end,
	Action = function( self, ent )

		self:MsgStart()
			net.WriteEntity( ent )
		self:MsgEnd()

	end,
	Receive = function( self, length, player )
		local ent = net.ReadEntity()
		if ( !self:Filter( ent, player ) ) then return end

		ent:SetLoyalistAccess(false)
	end
} )

if (SERVER) then
	function ENT:GetLockPosition(door, normal)
		local index = door:LookupBone("handle")
		local position = door:GetPos()
		normal = normal or door:GetForward():Angle()

		if (index and index >= 1) then
			position = door:GetBonePosition(index)
		end

		position = position + normal:Forward() * 7.2 + normal:Up() * 10 + normal:Right() * 2

		normal:RotateAroundAxis(normal:Up(), 90)
		normal:RotateAroundAxis(normal:Forward(), 180)
		normal:RotateAroundAxis(normal:Right(), 180)

		return position, normal
	end

	function ENT:SetDoor(door, position, angles)
		if (!IsValid(door) or !door:IsDoor()) then
			return
		end

		// liquid:
		// ghetto fix to things being out of sync
		do
			local doors = ents.FindByClass("prop_door_rotating")

			local parent = door:GetOwner()

			if (IsValid(parent)) then
				v.ixPartner = parent
				parent.ixPartner = door
			else
				for _, v2 in ipairs(doors) do
					if (v2:GetOwner() == door) then
						v2.ixPartner = door
						door.ixPartner = v2

						break
					end
				end
			end
		end

		local doorPartner = door:GetDoorPartner()

		self.door = door
		self.door:DeleteOnRemove(self)
		door.ixLock = self

		if (IsValid(doorPartner)) then
			self.doorPartner = doorPartner
			self.doorPartner:DeleteOnRemove(self)
			doorPartner.ixLock = self
            self.doorPartner:SetNWBool("CombineLocked", true)
		end

		self:SetPos(position)
		self:SetAngles(angles)
		self:SetParent(door)
        door:SetNWBool("CombineLocked", true)
	end

	function ENT:SpawnFunction(client, trace)
		local door = trace.Entity

		if (!IsValid(door) or !door:IsDoor() or IsValid(door.ixLock)) then
			return client:NotifyLocalized("dNotValid")
		end

		local normal = client:GetEyeTrace().HitNormal:Angle()
		local position, angles = self:GetLockPosition(door, normal)

		local entity = ents.Create("ix_combinelock")
		entity:SetPos(trace.HitPos)
		entity:Spawn()
		entity:Activate()
		entity:SetDoor(door, position, angles)

		Schema:SaveCombineLocks()
		return entity
	end

	function ENT:Initialize()
		self:SetModel("models/props_combine/combine_lock01.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		self:SetUseType(SIMPLE_USE)

		self.nextUseTime = 0
	end

	function ENT:OnRemove()
		if (IsValid(self)) then
			self:SetParent(nil)
		end

		if (IsValid(self.door)) then
			self.door:Fire("unlock")

			self.door.ixLock = nil
		end

		if (IsValid(self.doorPartner)) then
			self.doorPartner:Fire("unlock")
			self.doorPartner.ixLock = nil
		end

		if (!ix.shuttingDown) then
			Schema:SaveCombineLocks()
		end
	end

	function ENT:OnLockChanged(name, bWasLocked, bLocked)
		if (!IsValid(self.door)) then
			return
		end

		if (bLocked) then
			self:EmitSound("buttons/combine_button2.wav")
			self.door:Fire("lock")
			self.door:Fire("close")
			if self.door.ixParent
			and self.door.ixParent.ixChildren then
				for id, isChild in pairs(self.door.ixParent.ixChildren) do
					local e = ents.GetMapCreatedEntity(id)
					if IsValid(e) then
						e:Fire("lock") 
						e:Fire("close") 
					end
				end
			end

			if (IsValid(self.doorPartner)) then
				self.doorPartner:Fire("lock")
				self.doorPartner:Fire("close")
			end
		else
			self:EmitSound("buttons/combine_button7.wav")
			self.door:Fire("unlock")
			if self.door.ixParent
			and self.door.ixParent.ixChildren then
				for id, isChild in pairs(self.door.ixParent.ixChildren) do
					local e = ents.GetMapCreatedEntity(id)
					if IsValid(e) then e:Fire("unlock") end
				end
			end

			if (IsValid(self.doorPartner)) then
				self.doorPartner:Fire("unlock")
			end
		end
	end

	function ENT:DisplayError()
		self:EmitSound("buttons/combine_button_locked.wav")
		self:SetDisplayError(true)

		if self.ixBrokenByVort then return end

		timer.Simple(1.2, function()
			if (IsValid(self)) then
				self:SetDisplayError(false)
			end
		end)
	end

	function ENT:Toggle(client)
		if (self.nextUseTime > CurTime()) then
			return
		end
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local cid = inventory:HasItem("cid")
		local IsLoyalist = cid and cid:GetData("loyalty") and cid:GetData("loyalty").points >= 10
		local cwuAuthorized = client:IsCWU() and self:GetCWUAccess()
		local loyalistAuthorized = IsLoyalist and self:GetLoyalistAccess()

		if (!cwuAuthorized and !loyalistAuthorized and !client:IsCombine() and client:Team() != FACTION_DISTRICTADMINISTRATOR and client:Team() != FACTION_STAFF and client:Team() != FACTION_SYNTH and client:GetMoveType() != MOVETYPE_NOCLIP) then
			self:DisplayError()
			self.nextUseTime = CurTime() + 2

			return
		end

		if self.ixBrokenByVort then
			self:SetDisplayError(false)
			self.ixBrokenByVort = nil
		end

		self:SetLocked(!self:GetLocked())
		self.nextUseTime = CurTime() + 2
	end

	function ENT:Use(client)
		self:Toggle(client)
	end
else
	local glowMaterial = ix.util.GetMaterial("sprites/glow04_noz")
	local color_green = Color(0, 255, 0, 255)
	local color_blue = Color(0, 100, 255, 255)
	local color_orange = Color(228, 237, 0, 255)
	local color_cyan = Color(0, 237, 237)

	function ENT:Draw()
		self:DrawModel()

		local color = color_green

		if (self:GetDisplayError()) then
			color = Color(255, 0, 0, 255)
		elseif (self:GetLocked()) then
			if (self:GetCWUAccess()) then
				color = color_orange
			elseif self:GetLoyalistAccess() then
				color = color_cyan
			else
				color = color_blue
			end
		end

		local position = self:GetPos() + self:GetUp() * -8.7 + self:GetForward() * -3.85 + self:GetRight() * -6

		render.SetMaterial(glowMaterial)
		render.DrawSprite(position, 10, 10, color)
	end
end