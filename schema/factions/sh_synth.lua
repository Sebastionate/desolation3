
FACTION.name = "Synth"
FACTION.description = "A slave of the Universal Union, modified human-synth hybrids."
FACTION.color = Color(140, 10, 10)
FACTION.pay = 1
FACTION.payTime = 9006
FACTION.models = {"models/stalker.mdl"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true


function FACTION:GetDefaultName(client)
	return "UU-SYNTH." .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnSpawn(client)
	local character = client:GetCharacter()

	character:SetModel(self.models[1])
end

hook.Add("SetupMove", "DisableSprint", function(client, mv, usrmd)
	if (client:GetModel() == "models/stalker.mdl") then
	mv:SetMaxClientSpeed(60)
	end
end)

local CMoveData = FindMetaTable("CMoveData")

function CMoveData:RemoveKeys(keys)
	local newbuttons = bit.band(self:GetButtons(), bit.bnot(keys))
	self:SetButtons(newbuttons)
end

hook.Add("SetupMove", "Disable Jumping", function(ply, mvd, cmd) 
	if (ply:GetModel() == "models/stalker.mdl") then 
	if mvd:KeyDown(IN_JUMP) then
		mvd:RemoveKeys(IN_JUMP)
	end
	if mvd:KeyDown(IN_DUCK) then 
		mvd:RemoveKeys(IN_DUCK)
		end 
	end 
end)



FACTION_SYNTH = FACTION.index