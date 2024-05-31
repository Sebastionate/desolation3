
FACTION.name = "Civil Protection"
FACTION.description = "A metropolice unit working as Civil Protection."
FACTION.color = Color(50, 100, 150)
FACTION.pay = 10
FACTION.payTime = 2000
FACTION.models = {"models/humans/combine/female_01.mdl","models/humans/combine/female_02.mdl","models/humans/combine/female_03.mdl","models/humans/combine/female_ga.mdl","models/player/combine/male_01.mdl","models/player/combine/male_02.mdl","models/player/combine/male_03.mdl","models/player/combine/male_04.mdl", "models/player/combine/male_05.mdl","models/player/combine/male_06.mdl","models/player/combine/male_07.mdl","models/player/combine/male_08.mdl","models/player/combine/male_09.mdl"}
FACTION.weapons = {""}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()

	inventory:Add("pistol", 1)
	inventory:Add("pistolammo", 2)
	inventory:Add("longrange", 1)
	character:SetIsCrippled(false)
	character:SetIsHealed(true)
	character:GiveMoney(30)
end

function FACTION:GetDefaultName(client)
	return "C17.00:TAGLINE-" .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()
	character:SetIsCrippled(false)
	character:SetIsHealed(true)

	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

function Scanner(ply)
	e = ents.Create("pill_ent_phys")

    e:SetPos(ply:LocalToWorld(Vector(0, 0, 60)))

    e:SetPillForm("cityscanner")
    e:SetPillUser(ply)
    e.locked = false
    e:Spawn()
    e:Activate()
end

hook.Add("PlayerLoadedCharacter", "ixMetrocopStunstick", function(client, character)
	if client:Team() == FACTION_MPF then
		client:AddPart("stunstick")
	else
		client:RemovePart("stunstick")
	end
end)

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	if !value:find("RCT") and character:GetClass() == CLASS_MPR then
		character:JoinClass(CLASS_MPU)
	end
	
	local parts = string.Split(value, ".")
	if #parts == 3 then
			if	parts[2] == "i6" then
				character:JoinClass(CLASS_MPU)
			elseif parts[2] == "i5" then
				character:JoinClass(CLASS_MPU)
			elseif parts[2] == "i4" then
				character:JoinClass(CLASS_MPU)
			elseif parts[2] == "i3" then
				character:JoinClass(CLASS_NCO)
			elseif parts[2] == "i2" then
				character:JoinClass(CLASS_NCO)
			elseif parts[2] == "i1" then
				character:JoinClass(CLASS_NCO)
			end
	end

	if (Schema:IsCombineRank(value, "SeC")) then
		character:SetModel("models/dpfilms/metropolice/blacop.mdl")
		character:JoinClass(CLASS_EMP)
	elseif (Schema:IsCombineRank(value, "CmD")) then
		character:SetModel("models/dpfilms/metropolice/police_bt.mdl")
		character:JoinClass(CLASS_EMP)
	end

	if (!Schema:IsCombineRank(oldValue, "GHOST") and Schema:IsCombineRank(value, "GHOST")) then
		character:SetModel("models/eliteghostcp.mdl")
	end
end

FACTION_MPF = FACTION.index

hook.Add("IsCharacterRecognized", "MPF Recognition", function(character, id)
	local faction = character:GetFaction() 
	if character:GetPlayer():Team() == FACTION_STAFF then
		return true
	end

	if character:GetPlayer():Team() == FACTION_MPF and faction ~= FACTION_MPF then
		return true
	end
end)