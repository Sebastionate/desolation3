ITEM.name = "Santa Hat"
ITEM.description = "Merry Christmas!"
ITEM.model = "models/captainbigbutt/skeyler/hats/santa.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.outfitCategory = "hat"
ITEM.noDrop = true

ITEM.iconCam = {
	pos = Vector(230.02339172363, 196.03033447266, 146.72901916504),
	ang = Angle(25, 220, 0),
	fov = 4.8998174984356,
}

function ITEM:PaintOver(item, w, h)
    surface.SetDrawColor(255, 223, 0, 10)
    surface.DrawRect(0, 0, w, h)
end

ITEM.pacData = {
    [1] = {
        ["children"] = {
            [1] = {
                ["children"] = {
                },
                ["self"] = {
                    ["Invert"] = false,
                    ["EyeTargetName"] = "",
                    ["NoLighting"] = false,
                    ["OwnerName"] = "self",
                    ["AimPartName"] = "",
                    ["IgnoreZ"] = false,
                    ["AimPartUID"] = "",
                    ["Materials"] = "",
                    ["Name"] = "",
                    ["LevelOfDetail"] = 0,
                    ["NoTextureFiltering"] = false,
                    ["PositionOffset"] = Vector(0, 0, 0),
                    ["NoCulling"] = false,
                    ["Translucent"] = false,
                    ["DrawOrder"] = 0,
                    ["Alpha"] = 1,
                    ["Material"] = "",
                    ["Bone"] = "head",
                    ["UniqueID"] = "1474125619",
                    ["BoneMerge"] = false,
                    ["EyeTargetUID"] = "",
                    ["Position"] = Vector(3.7081909179688, -0.2703857421875, 0.0068359375),
                    ["BlendMode"] = "",
                    ["Angles"] = Angle(-4.9718170166016, -83.270881652832, -90.587440490723),
                    ["Hide"] = false,
                    ["EyeAngles"] = false,
                    ["Scale"] = Vector(1, 1, 1),
                    ["AngleOffset"] = Angle(0, 0, 0),
                    ["EditorExpand"] = false,
                    ["Size"] = 0.75,
                    ["Color"] = Vector(1, 1, 1),
                    ["ClassName"] = "model2",
                    ["IsDisturbing"] = false,
                    ["ModelModifiers"] = "",
                    ["Model"] = "models/captainbigbutt/skeyler/hats/santa.mdl",
                },
            },
        },
        ["self"] = {
            ["DrawOrder"] = 0,
            ["UniqueID"] = "833402",
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