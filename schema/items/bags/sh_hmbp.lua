ITEM.name = "Scavenger's Bag"
ITEM.description = "A shabby looking backpack made from cloth. Looks like it'll get the job done."
ITEM.invWidth = 4
ITEM.invHeight = 4
ITEM.model = "models/tnb/techcom/pack_trizip.mdl"
ITEM.width = 1
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
					["LightBlend"] = 1,
					["CellShade"] = 0,
					["OwnerName"] = "self",
					["AimPartName"] = "",
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "",
					["NoTextureFiltering"] = false,
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["IsDisturbing"] = false,
					["Fullbright"] = false,
					["EyeAngles"] = false,
					["DrawOrder"] = 0,
					["TintColor"] = Vector(0, 0, 0),
					["UniqueID"] = "2551663951",
					["Translucent"] = false,
					["LodOverride"] = -1,
					["BlurSpacing"] = 0,
					["Alpha"] = 1,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["UsePlayerColor"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "head",
					["Color"] = Vector(255, 255, 255),
					["Brightness"] = 1,
					["BoneMerge"] = true,
					["BlurLength"] = 0,
					["Position"] = Vector(0, 0, 0),
					["AngleOffset"] = Angle(0, 0, 0),
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["OwnerEntity"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 1,
					["ModelFallback"] = "",
					["Angles"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/tnb/techcom/pack_trizip.mdl",
					["BlendMode"] = "",
				},
			},
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "809213420",
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
	hook.Add("Think", "hmbpThinkServer", function()
		for _, v in ipairs(player.GetAll()) do
			local char = v:GetCharacter()
			if not char then continue end
			local inventory = char:GetInventory()
			if not inventory then continue end
			local hasBackpack = false
			local skip = false

			if v:IsCombine() then
				skip = true
			end

			if v:GetMoveType() == MOVETYPE_NOCLIP then
				skip = true
			end

			if not skip then
				for _, item in pairs(inventory:GetItems()) do
					if item.uniqueID == "hmbp" then
						hasBackpack = true

						if not v:GetParts()[item.uniqueID] then
							v:AddPart(item.uniqueID, item)
							break
						end
					end
				end
			end

			if not hasBackpack and v:GetParts()["hmbp"] then
				v:RemovePart("hmbp")
			end
		end
	end)

	hook.Add("CanPlayerTakeItem", "hmbpRestrict", function(client, item)
		item = item:GetItemTable()
		if item.uniqueID != "hmbp" then return true end
		local total = 0
		for k, v in pairs(client:GetCharacter():GetInventory():GetItems()) do
			if v.uniqueID == "hmbp" then
				total = total + 1
			end
		end
		if total >= 2 then
			ix.util.Notify("You cannot carry more than 2 backpacks at a time", client)
			return false
		end
	end)
end