ITEM.name = "Alice Pack"
ITEM.description = "A large backpack, able to hold more items than a regular one."
ITEM.skin = 0
ITEM.invWidth = 6
ITEM.invHeight = 4
ITEM.price = 100

ITEM.model = "models/warz/alicebackpack.mdl"
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
					["UniqueID"] = "1446715698",
					["Translucent"] = false,
					["LodOverride"] = -1,
					["BlurSpacing"] = 0,
					["Alpha"] = 1,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["UsePlayerColor"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "spine 4",
					["Color"] = Vector(255, 255, 255),
					["Brightness"] = 1,
					["BoneMerge"] = false,
					["BlurLength"] = 0,
					["Position"] = Vector(-19.479248046875, -6.08203125, -4.244140625),
					["AngleOffset"] = Angle(0, 0, 0),
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["OwnerEntity"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 0.899,
					["ModelFallback"] = "",
					["Angles"] = Angle(-86.366874694824, 123.36392974854, 54.839389801025),
					["TextureFilter"] = 3,
					["Model"] = "models/warz/alicebackpack.mdl",
					["BlendMode"] = "",
				},
			},
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "2973943033",
			["AimPartUID"] = "",
			["Hide"] = false,
			["Duplicate"] = false,
			["ClassName"] = "group",
			["OwnerName"] = "self",
			["IsDisturbing"] = false,
			["Name"] = "my outfit",
			["EditorExpand"] = true,
		},
	},
}

if SERVER then
	hook.Add("Think", "AlicepackThinkServer", function()
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
					if item.uniqueID == "alicepack" then
						hasBackpack = true

						if not v:GetParts()[item.uniqueID] then
							v:AddPart(item.uniqueID, item)
							break
						end
					end
				end
			end

			if not hasBackpack and v:GetParts()["alicepack"] then
				v:RemovePart("alicepack")
			end
		end
	end)

	hook.Add("CanPlayerTakeItem", "AlicepackRestrict", function(client, item)
		item = item:GetItemTable()
		if item.uniqueID != "alicepack" then return true end
		local total = 0
		for k, v in pairs(client:GetCharacter():GetInventory():GetItems()) do
			if v.uniqueID == "alicepack" then
				total = total + 1
			end
		end
		if total >= 2 then
			ix.util.Notify("You cannot carry more than 2 backpacks at a time", client)
			return false
		end
	end)
end