ITEM.name = "Paper"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A paper in which you can read and write on."
ITEM.price = 10

hook.Add("CanPlayerInteractItem", "NoTakePaper", function(client, action, item, data)
	if action ~= 'take' then return end
	if client:Team() == FACTION_STAFF then return true end
	local canOthersWrite = item:GetData("canOthersWrite", false)
	if !canOthersWrite then
		local owner = item:GetData("PaperOwner")
		if owner == nil then return end
		if owner ~= client:GetCharacter():GetID() then
			return false
		end
	end
end)

ITEM.functions.write = {
	name = "Write",
	icon = "icon16/pencil.png",
	OnRun = function(item)
		local client = item.player
		local id = item:GetID()
		if (id) then
			local canWrite = true
			local owner = item:GetData("PaperOwner")
			if !item:GetData("canOthersWrite", false) and owner ~= nil and owner ~= client:GetCharacter():GetID() then
				canWrite = false
			end
			netstream.Start(client, "receivePaper", id, item:GetData("PaperData") or "", canWrite)
		end
		return false
	end,
	OnCanRun = function(item)
		if item:GetData("readOnly", false) then return false end

		local canOthersWrite = item:GetData("canOthersWrite")
		if !canOthersWrite then
			local owner = item:GetData("PaperOwner")
			if owner == nil then return end
			if owner ~= item.player:GetCharacter():GetID() then
				return false
			end
		end

		return true
	end
}

ITEM.functions.Pin = {
    name = "Pin to surface",
    icon = "icon16/page_add.png",
    OnRun = function(item)

    	local client = item.player

    	local data = {}
		data.start = client:EyePos()
		data.endpos = data.start + client:GetForward() * 60
		data.filter = client

		local trace = util.TraceLine(data)

		local itemAngle = item.player:GetAngles()
		local itemPos = trace.HitPos - client:GetForward() * 1.2

		if (trace.Hit) then

			ix.item.Spawn(item.uniqueID,itemPos,function(item,entity)

			local physObj = entity:GetPhysicsObject()
			physObj:EnableMotion(false)
            physObj:Sleep()

			end,item.player:GetAngles()+Angle(90,180,0),item.data)

			return true
		end	

        return false
    end,

    OnCanRun = function(item)
		local owner = item:GetData("owner", 0)
        -- local pinned = item:GetData("pin", false)

        return !IsValid(item.entity) and !item.noDrop
    end
}

ITEM.functions.read = {
	name = "Read",
	icon = "icon16/pencil.png",
	OnRun = function(item)
		local client = item.player
		local id = item:GetID()
		if (id) then
			local canWrite = true
			local owner = item:GetData("PaperOwner")
			if owner ~= nil and owner ~= client:GetCharacter():GetID() then
				canWrite = false
			end
			netstream.Start(client, "receivePaper", id, item:GetData("PaperData") or "", false)
		end
		return false
	end,
	OnCanRun = function(item)
		//local owner = item:GetData("PaperOwner")
		//if !owner or owner == item.player:GetCharacter():GetID() then
		//	return false
		//end

		return true
	end
}

ITEM.functions.enableWrite = {
	name = "Enable writing for others",
	icon = "icon16/lock_open.png",
	OnRun = function(item)
		item:SetData("canOthersWrite", true)
		return false
	end,
	OnCanRun = function(item)
		local client = item.player
		if item:GetData("canOthersWrite") == true then return false end
		if client:Team() == FACTION_STAFF then return true end

		local owner = item:GetData("PaperOwner")
		if !owner or owner != item.player:GetCharacter():GetID() then
			return false
		end

		return true
	end
}

ITEM.functions.disableWrite = {
	name = "Disable writing for others",
	icon = "icon16/lock.png",
	OnRun = function(item)
		item:SetData("canOthersWrite", false)
		return false
	end,
	OnCanRun = function(item)
		local client = item.player
		if item:GetData("canOthersWrite") ~= true then return false end
		if client:Team() == FACTION_STAFF then return true end

		local owner = item:GetData("PaperOwner")
		if !owner or owner != item.player:GetCharacter():GetID() then
			return false
		end

		return true
	end
}