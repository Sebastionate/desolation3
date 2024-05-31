
ITEM.name = "Makeshift Face Mask"
ITEM.description = "A vest made from folded and pressed sheet metal. Looks like it could stop a round or two."
ITEM.model = "models/rust/attire_metalfacemask.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-2.46, -729.67, 80.4),
	ang = Angle(6.29, 89.81, 0),
	fov = 1
}
ITEM.category = "Rebel Tech"
ITEM.maxArmor = 15

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
    warning:SetBackgroundColor(ix.config.Get("color"))
    warning:SetText("This item can be broken down 3x Steel Pieces, and 1x Cloth Strip")
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
                            ["Bone"] = "head",
                            ["Color"] = Vector(255, 255, 255),
                            ["Brightness"] = 1,
                            ["BoneMerge"] = false,
                            ["BlurLength"] = 0,
                            ["Position"] = Vector(2.884765625, -2.075927734375, -0.049918174743652),
                            ["AngleOffset"] = Angle(0, 0, 0),
                            ["AlternativeScaling"] = false,
                            ["Hide"] = false,
                            ["OwnerEntity"] = false,
                            ["Scale"] = Vector(0.93000000715256, 1, 0.94999998807907),
                            ["ClassName"] = "model",
                            ["EditorExpand"] = false,
                            ["Size"] = 1,
                            ["ModelFallback"] = "",
                            ["Angles"] = Angle(87.353912353516, -89.121170043945, -89.119773864746),
                            ["TextureFilter"] = 3,
                            ["Model"] = "models/rust/attire_metalfacemask.mdl",
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
                            ["Bone"] = "head",
                            ["Color"] = Vector(255, 255, 255),
                            ["Brightness"] = 1,
                            ["BoneMerge"] = false,
                            ["BlurLength"] = 0,
                            ["Position"] = Vector(3.798828125, -2.31201171875, 0.025634765625),
                            ["AngleOffset"] = Angle(0, 0, 0),
                            ["AlternativeScaling"] = false,
                            ["Hide"] = false,
                            ["OwnerEntity"] = false,
                            ["Scale"] = Vector(0.93999999761581, 1.0499999523163, 0.93999999761581),
                            ["ClassName"] = "model",
                            ["EditorExpand"] = false,
                            ["Size"] = 1,
                            ["ModelFallback"] = "",
                            ["Angles"] = Angle(90, 7.2350177764893, 0),
                            ["TextureFilter"] = 3,
                            ["Model"] = "models/rust/attire_metalfacemask.mdl",
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
