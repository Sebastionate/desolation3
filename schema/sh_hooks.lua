
function Schema:CanPlayerUseBusiness(client, uniqueID)
	--[[if (client:Team() == FACTION_CITIZEN) then
		local itemTable = ix.item.list[uniqueID]

		if (itemTable) then
			if (itemTable.permit) then
				local character = client:GetCharacter()
				local inventory = character:GetInventory()

				if (!inventory:HasItem("permit_"..itemTable.permit)) then
					return false
				end
			elseif (itemTable.base ~= "base_permit") then
				return false
			end
		end
	end]]
end

-- called when the client wants to view the combine data for the given target
function Schema:CanPlayerViewData(client, target)
	if client:IsCombine() and client:Team() != FACTION_CIC or client:IsDispatch() and (!target:IsCombine() and target:Team() != FACTION_ADMIN) then
		return true
	end
end

-- called when the client wants to edit the combine data for the given target
function Schema:CanPlayerEditData(client, target)
	return client:IsCombine() or client:IsDispatch() and (!target:IsCombine() and target:Team() != FACTION_ADMIN)
end

function Schema:CanPlayerViewObjectives(client)
	if client:IsCombine() and client:Team() != FACTION_CIC or client:IsDispatch() then
		return true
	end
end

function Schema:CanPlayerEditObjectives(client)
	if (!client:IsCombine() or !client:GetCharacter()) then
		return false
	end

	local bCanEdit = false
	local name = client:GetCharacter():GetName()

	for k, v in ipairs({"OfC", "EpU", "RL", "DvL", "SeC", "CmD", "HtI", "EfO"}) do
		if (self:IsCombineRank(name, v)) then
			bCanEdit = true
			break
		end
	end

	return bCanEdit
end

function Schema:CanDrive()
	return false
end
