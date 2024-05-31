
FACTION.name = "Overwatch Transhuman Arm"
FACTION.description = "A transhuman Overwatch soldier produced by the Combine."
FACTION.color = Color(150, 50, 50, 255)
FACTION.pay = 40
FACTION.payTime = 1200
FACTION.models = {"models/ninja/combine_soldier_reimagine.mdl"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true
FACTION.runSounds = {[0] = "NPC_CombineS.RunFootstepLeft", [1] = "NPC_CombineS.RunFootstepRight"}

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("longrange", 1)
	character:GiveMoney(30)
end

function FACTION:GetDefaultName(client)
	return "OTA-GRUNT.OWS-" .. Schema:ZeroNumber(math.random(1, 99999), 5), true
end

function FACTION:ShouldShowPlayerOnScoreboard(client)
	if client:Team() == FACTION_OTA then
		return false
	end
end

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()

	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	if (!Schema:IsCombineRank(oldValue, "OWS") and Schema:IsCombineRank(value, "OWS")) then
		character:JoinClass(CLASS_OWS)
	elseif (!Schema:IsCombineRank(oldValue, "EOW") and Schema:IsCombineRank(value, "EOW")) then
		character:JoinClass(CLASS_EOW)
	
	elseif (!Schema:IsCombineRank(oldValue, "OWR") and Schema:IsCombineRank(value, "OWR")) then 
		character:JoinClass(CLASS_OWR)
	end
	if (value:find("ECHO") ~= nil) then
		character:SetModel("models/combine_soldierproto.mdl")
		client:SetSkin(0)
	elseif (value:find("MACE") ~= nil) then
		character:SetModel("models/combine_soldierproto.mdl")
		client:SetSkin(1)
	elseif (value:find("KING") ~= nil) then
		character:SetModel("models/combine_super_soldierproto.mdl")
		client:SetSkin(0)
	elseif (value:find("RANGER") != nil) then 
			character:SetModel("models/combine_soldierproto.mdl")
			client:SetSkin(13)
		elseif (value:find("GRUNT") != nil) then 
			character:SetModel("models/ninja/combine_soldier_reimagine.mdl")
			client:SetSkin(0)
			client:SetBodygroup(3, 1)
			client:SetBodygroup(4, 1)
		end
	
end

FACTION_OTA = FACTION.index


hook.Add("ShouldShowPlayerOnScoreboard", "hideOTA", function(client)
	if client:Team() == FACTION_OTA and LocalPlayer():Team() != FACTION_OTA and not LocalPlayer():Team() != FACTION_UU and not LocalPlayer():IsAdmin() then
		return false
	end
end)
