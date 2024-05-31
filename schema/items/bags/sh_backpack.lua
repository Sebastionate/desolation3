ITEM.name = "Backpack"
ITEM.description = "A black backpack, with the zippers broken off."
ITEM.skin = 0
ITEM.invWidth = 5
ITEM.invHeight = 3
ITEM.price = 50

ITEM.model = "models/modified/backpack_3.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-38.684719085693, 24.966117858887, 0),
	ang = Angle(0, -37.380764007568, 0),
	fov = 40.320048245991
}

ITEM.pacData = {
	[1] = {
		["children"] = {
			[1] = {
				["children"] = {
					[1] = {
						["children"] = {},
						["self"] = {
							["AffectChildrenOnly"] = false,
							["Invert"] = true,
							["RootOwner"] = true,
							["OwnerName"] = "self",
							["AimPartUID"] = "",
							["TargetPartUID"] = "",
							["Hide"] = false,
							["Name"] = "",
							["EditorExpand"] = false,
							["Arguments"] = "/female",
							["Event"] = "model_name",
							["ClassName"] = "event",
							["ZeroEyePitch"] = false,
							["IsDisturbing"] = false,
							["Operator"] = "find simple",
							["UniqueID"] = "2285133409",
							["TargetPartName"] = ""
						}
					}
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
					["Name"] = "backpack female",
					["NoTextureFiltering"] = false,
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["IsDisturbing"] = false,
					["Fullbright"] = false,
					["EyeAngles"] = false,
					["DrawOrder"] = 0,
					["TintColor"] = Vector(0, 0, 0),
					["UniqueID"] = "2275223683",
					["Translucent"] = false,
					["LodOverride"] = -1,
					["BlurSpacing"] = 0,
					["Alpha"] = 1,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["UsePlayerColor"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "chest",
					["Color"] = Vector(255, 255, 255),
					["Brightness"] = 1,
					["BoneMerge"] = false,
					["BlurLength"] = 0,
					["Position"] = Vector(-3.0906982421875, -0.064453125, -4.8292236328125),
					["AngleOffset"] = Angle(0, 0, 0),
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["OwnerEntity"] = false,
					["Scale"] = Vector(1, 0.92500001192093, 1),
					["ClassName"] = "model",
					["EditorExpand"] = true,
					["Size"] = 0.875,
					["ModelFallback"] = "",
					["Angles"] = Angle(5.1746020317078, -0.39012509584427, -5.1039361953735),
					["TextureFilter"] = 3,
					["Model"] = "models/modified/backpack_3.mdl",
					["BlendMode"] = ""
				}
			},
			[2] = {
				["children"] = {
					[1] = {
						["children"] = {},
						["self"] = {
							["AffectChildrenOnly"] = false,
							["Invert"] = false,
							["RootOwner"] = true,
							["OwnerName"] = "self",
							["AimPartUID"] = "",
							["TargetPartUID"] = "",
							["Hide"] = false,
							["Name"] = "",
							["EditorExpand"] = false,
							["Arguments"] = "/female",
							["Event"] = "model_name",
							["ClassName"] = "event",
							["ZeroEyePitch"] = false,
							["IsDisturbing"] = false,
							["Operator"] = "find simple",
							["UniqueID"] = "146568264",
							["TargetPartName"] = ""
						}
					}
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
					["Name"] = "backpack male",
					["NoTextureFiltering"] = false,
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["IsDisturbing"] = false,
					["Fullbright"] = false,
					["EyeAngles"] = false,
					["DrawOrder"] = 0,
					["TintColor"] = Vector(0, 0, 0),
					["UniqueID"] = "19762749",
					["Translucent"] = false,
					["LodOverride"] = -1,
					["BlurSpacing"] = 0,
					["Alpha"] = 1,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["UsePlayerColor"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "chest",
					["Color"] = Vector(255, 255, 255),
					["Brightness"] = 1,
					["BoneMerge"] = false,
					["BlurLength"] = 0,
					["Position"] = Vector(-1.6208124160767, 0.13976246118546, -2.4386658668518),
					["AngleOffset"] = Angle(0, 0, 0),
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["OwnerEntity"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = true,
					["Size"] = 0.875,
					["ModelFallback"] = "",
					["Angles"] = Angle(4.0951251983643, -0.78999924659729, -5.1413674354553),
					["TextureFilter"] = 3,
					["Model"] = "models/modified/backpack_3.mdl",
					["BlendMode"] = ""
				}
			}
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "2845060044",
			["AimPartUID"] = "",
			["Hide"] = false,
			["Duplicate"] = false,
			["ClassName"] = "group",
			["OwnerName"] = "self",
			["IsDisturbing"] = false,
			["Name"] = "ixBackpack",
			["EditorExpand"] = true
		}
	}
}

if SERVER then
	hook.Add("Think", "BackpackThinkServer", function()
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
					if item.uniqueID == "backpack" then
						hasBackpack = true

						if not v:GetParts()[item.uniqueID] then
							v:AddPart(item.uniqueID, item)
							break
						end
					end
				end
			end

			if not hasBackpack and v:GetParts()["backpack"] then
				v:RemovePart("backpack")
			end
		end
	end)

	hook.Add("CanPlayerTakeItem", "BackpackRestrict", function(client, item)
		item = item:GetItemTable()
		if item.uniqueID != "backpack" then return true end
		local total = 0
		for k, v in pairs(client:GetCharacter():GetInventory():GetItems()) do
			if v.uniqueID == "backpack" then
				total = total + 1
			end
		end
		if total >= 2 then
			ix.util.Notify("You cannot carry more than 2 backpacks at a time", client)
			return false
		end
	end)
end