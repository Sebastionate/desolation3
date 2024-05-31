local playerMeta = FindMetaTable("Player")

function playerMeta:IsCombine()
	local faction = self:Team()
	return faction == FACTION_MPF or faction == FACTION_OTA or faction == FACTION_CIC or faction == FACTION_DISPATCH or faction == FACTION_UNI
end

function playerMeta:IsCWU()
	local faction = self:Team()
	return faction == FACTION_CWU 
	or faction == FACTION_CAU
	or faction == FACTION_COUNC
	or faction == FACTION_CIU
	or faction == FACTION_CWUDIRECT
end

function playerMeta:IsDispatch()
	local name = self:Name()
	local faction = self:Team()
	local bStatus = faction == FACTION_OTA or faction == FACTION_DISPATCH

	if (!bStatus) then
		for k, v in ipairs({ "SCN", "DvL", "SeC" }) do
			if (Schema:IsCombineRank(name, v) or name:find("SCN")) then
				bStatus = true

				break
			end
		end
	end

	return bStatus
end
