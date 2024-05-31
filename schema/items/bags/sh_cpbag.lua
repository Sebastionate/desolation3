ITEM.name = "Civil Protection Bag"
ITEM.description = "A utility backpack issued to members of Civil Protection."
ITEM.invWidth = 5
ITEM.invHeight = 4
ITEM.model = "models/dpfilms/metropolice/props/metrold_backpack.mdl"
ITEM.width = 2
ITEM.height = 2

ITEM.pacData = {
	[1] = {
		["children"] = {
			[1] = {
				["children"] = {
				},
				["self"] = {
					["Skin"] = 0,
					["Invert"] = false,
					["EyeTargetName"] = "",
					["NoLighting"] = false,
					["OwnerName"] = "self",
					["AimPartName"] = "",
					["BlendMode"] = "",
					["AimPartUID"] = "",
					["Materials"] = "",
					["Name"] = "cpbag",
					["LevelOfDetail"] = 0,
					["NoTextureFiltering"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["IsDisturbing"] = false,
					["Translucent"] = false,
					["DrawOrder"] = 0,
					["Alpha"] = 1,
					["Material"] = "",
					["ModelModifiers"] = "",
					["Bone"] = "head",
					["UniqueID"] = "864061948",
					["EyeTargetUID"] = "",
					["BoneMerge"] = true,
					["NoCulling"] = false,
					["Position"] = Vector(0, 0, 0),
					["AngleOffset"] = Angle(0, 0, 0),
					["Color"] = Vector(1, 1, 1),
					["Hide"] = false,
					["Angles"] = Angle(0, 0, 0),
					["Scale"] = Vector(1, 1, 1),
					["EyeAngles"] = false,
					["EditorExpand"] = false,
					["Size"] = 1,
					["ClassName"] = "model2",
					["IgnoreZ"] = false,
					["Brightness"] = 1,
					["Model"] = "models/dpfilms/metropolice/props/metrold_backpack.mdl",
					["ForceObjUrl"] = false,
				},
			},
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "603596130",
			["AimPartUID"] = "",
			["Hide"] = false,
			["Duplicate"] = false,
			["ClassName"] = "group",
			["OwnerName"] = "self",
			["IsDisturbing"] = false,
			["Name"] = "my outfit",
			["EditorExpand"] = true,
		}
	}
}

if SERVER then
	hook.Add("Think", "cpbagThinkServer", function()
		for _, v in ipairs(player.GetAll()) do
			local char = v:GetCharacter()
			if not char then continue end
			local inventory = char:GetInventory()
			if not inventory then continue end
			local hasBackpack = false
			local skip = false

			if v:GetMoveType() == MOVETYPE_NOCLIP then
				skip = true
			end

			if not skip then
				for _, item in pairs(inventory:GetItems()) do
					if item.uniqueID == "cpbag" then
						hasBackpack = true

						if not v:GetParts()[item.uniqueID] then
							v:AddPart(item.uniqueID, item)
							break
						end
					end
				end
			end

			if not hasBackpack and v:GetParts()["cpbag"] then
				v:RemovePart("cpbag")
			end
		end
	end)

	hook.Add("CanPlayerTakeItem", "cpbagkRestrict", function(client, item)
		item = item:GetItemTable()
		if item.uniqueID != "cpbag" then return true end
		local total = 0
		for k, v in pairs(client:GetCharacter():GetInventory():GetItems()) do
			if v.uniqueID == "cpbag" then
				total = total + 1
			end
		end
		if total >= 2 then
			ix.util.Notify("You cannot carry more than 2 backpacks at a time", client)
			return false
		end
	end)
end