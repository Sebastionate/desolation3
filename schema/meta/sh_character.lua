
local CHAR = ix.meta.character

function CHAR:IsCombine()
	local faction = self:GetFaction()
	return faction == FACTION_MPF or faction == FACTION_OTA or faction == FACTION_DISPATCH or faction == FACTION_UNI
end
