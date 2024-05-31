
ITEM.name = "Makeshift Plate Vest"
ITEM.description = "A vest made from folded and pressed sheet metal. Looks like it could stop a round or two."
ITEM.model = "models/rust/attire_metalchestplate.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-0.15, -199.87, -7.32),
	ang = Angle(-2.48, 90.24, 0),
	fov = 6.03
}

ITEM.category = "Rebel Tech"
ITEM.maxArmor = 25

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
    warning:SetBackgroundColor(ix.config.Get("color"))
    warning:SetText("This item can be broken down 1x Steel Sheet, and 1x Cloth Strip")
    warning:SetFont("DermaDefault")
    warning:SetExpensiveShadow(0.5)
    warning:SizeToContents()
end

ITEM.pacData = {
    [1] = {
        ["children"] = {
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
                            ["UniqueID"] = "1022446243",
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
                            ["Position"] = Vector(-2.612548828125, 0.042938232421875, -3.9501953125),
                            ["AngleOffset"] = Angle(0, 0, 0),
                            ["AlternativeScaling"] = false,
                            ["Hide"] = false,
                            ["OwnerEntity"] = false,
                            ["Scale"] = Vector(0.77999997138977, 0.89999997615814, 0.89999997615814),
                            ["ClassName"] = "model",
                            ["EditorExpand"] = false,
                            ["Size"] = 1,
                            ["ModelFallback"] = "",
                            ["Angles"] = Angle(-4.3542455387069e-05, 92.413734436035, -2.1771234969492e-05),
                            ["TextureFilter"] = 3,
                            ["Model"] = "models/rust/attire_metalchestplate.mdl",
                            ["BlendMode"] = "",
                        },
                    },
                },
                ["self"] = {
                    ["AffectChildrenOnly"] = false,
                    ["Invert"] = true,
                    ["RootOwner"] = true,
                    ["OwnerName"] = "self",
                    ["AimPartUID"] = "",
                    ["TargetPartUID"] = "",
                    ["Hide"] = false,
                    ["Name"] = "",
                    ["EditorExpand"] = true,
                    ["Arguments"] = "citizens/female",
                    ["Event"] = "model_name",
                    ["ClassName"] = "event",
                    ["ZeroEyePitch"] = false,
                    ["IsDisturbing"] = false,
                    ["Operator"] = "find",
                    ["UniqueID"] = "3378130321",
                    ["TargetPartName"] = "",
                },
            },
        },
        ["self"] = {
            ["DrawOrder"] = 0,
            ["UniqueID"] = "2346729648",
            ["AimPartUID"] = "",
            ["Hide"] = false,
            ["Duplicate"] = false,
            ["ClassName"] = "group",
            ["OwnerName"] = "self",
            ["IsDisturbing"] = false,
            ["Name"] = "Vest",
            ["EditorExpand"] = true,
        },
    },
    [2] = {
        ["children"] = {
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
                            ["UniqueID"] = "759412449",
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
                            ["Position"] = Vector(-1.6156311035156, 0.25796508789063, -3.275390625),
                            ["AngleOffset"] = Angle(0, 0, 0),
                            ["AlternativeScaling"] = false,
                            ["Hide"] = false,
                            ["OwnerEntity"] = false,
                            ["Scale"] = Vector(0.89999997615814, 0.89999997615814, 1),
                            ["ClassName"] = "model",
                            ["EditorExpand"] = false,
                            ["Size"] = 1,
                            ["ModelFallback"] = "",
                            ["Angles"] = Angle(-4.3542455387069e-05, 92.413734436035, -2.1771234969492e-05),
                            ["TextureFilter"] = 3,
                            ["Model"] = "models/rust/attire_metalchestplate.mdl",
                            ["BlendMode"] = "",
                        },
                    },
                },
                ["self"] = {
                    ["AffectChildrenOnly"] = false,
                    ["Invert"] = true,
                    ["RootOwner"] = true,
                    ["OwnerName"] = "self",
                    ["AimPartUID"] = "",
                    ["TargetPartUID"] = "",
                    ["Hide"] = false,
                    ["Name"] = "",
                    ["EditorExpand"] = true,
                    ["Arguments"] = "citizens/male",
                    ["Event"] = "model_name",
                    ["ClassName"] = "event",
                    ["ZeroEyePitch"] = false,
                    ["IsDisturbing"] = false,
                    ["Operator"] = "find",
                    ["UniqueID"] = "1526883549",
                    ["TargetPartName"] = "",
                },
            },
        },
        ["self"] = {
            ["DrawOrder"] = 0,
            ["UniqueID"] = "3845645864",
            ["AimPartUID"] = "",
            ["Hide"] = false,
            ["Duplicate"] = false,
            ["ClassName"] = "group",
            ["OwnerName"] = "self",
            ["IsDisturbing"] = false,
            ["Name"] = "",
            ["EditorExpand"] = true,
        },
    },
}    
