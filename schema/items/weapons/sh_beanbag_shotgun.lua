ITEM.name = "Beanbag Shotgun"
ITEM.description = "A non-lethal pump-action shotgun used to disorient others."
ITEM.model = "models/weapons/w_shotgun.mdl"
ITEM.class = "beanbag_shotgun"
ITEM.weaponCategory = "primary"
ITEM.classes = {}
--ITEM.flag = "V"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 300

ITEM.iconCam = {
    pos = Vector(0, 200, 1),
    ang = Angle(0, 270, 0),
    fov = 10
}
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
                            ["UniqueID"] = "1326439476",
                            ["Translucent"] = false,
                            ["LodOverride"] = -1,
                            ["BlurSpacing"] = 0,
                            ["Alpha"] = 1,
                            ["Material"] = "",
                            ["UseWeaponColor"] = false,
                            ["UsePlayerColor"] = false,
                            ["UseLegacyScale"] = false,
                            ["Bone"] = "spine 2",
                            ["Color"] = Vector(255, 255, 255),
                            ["Brightness"] = 1,
                            ["BoneMerge"] = false,
                            ["BlurLength"] = 0,
                            ["Position"] = Vector(-2.2004699707031, -5.7183837890625, 3.447265625),
                            ["AngleOffset"] = Angle(0, 0, 0),
                            ["AlternativeScaling"] = false,
                            ["Hide"] = false,
                            ["OwnerEntity"] = false,
                            ["Scale"] = Vector(1, 1, 1),
                            ["ClassName"] = "model",
                            ["EditorExpand"] = false,
                            ["Size"] = 1,
                            ["ModelFallback"] = "",
                            ["Angles"] = Angle(6.181652545929, 3.6081132888794, 178.61079406738),
                            ["TextureFilter"] = 3,
                            ["Model"] = "models/weapons/w_shotgun.mdl",
                            ["BlendMode"] = "",
                        },
                    },
                },
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
                    ["Arguments"] = "weapon_shotgun",
                    ["Event"] = "weapon_class",
                    ["ClassName"] = "event",
                    ["ZeroEyePitch"] = false,
                    ["IsDisturbing"] = false,
                    ["Operator"] = "find simple",
                    ["UniqueID"] = "3503525391",
                    ["TargetPartName"] = "",
                },
            },
        },
        ["self"] = {
            ["DrawOrder"] = 0,
            ["UniqueID"] = "3111182473",
            ["AimPartUID"] = "",
            ["Hide"] = false,
            ["Duplicate"] = false,
            ["ClassName"] = "group",
            ["OwnerName"] = "self",
            ["IsDisturbing"] = false,
            ["Name"] = "",
            ["EditorExpand"] = true,
        },
    }    
}