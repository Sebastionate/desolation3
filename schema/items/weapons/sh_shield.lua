ITEM.name = "Riot Shield"
ITEM.description = "Used to protect from melee attacks with blunt or edged weapons and also thrown projectiles."
ITEM.model = "models/arleitiss/riotshield/shield.mdl"
ITEM.class = "swat_shield"
ITEM.weaponCategory = "melee"
ITEM.classes = {}
--ITEM.flag = "V"
ITEM.price = 400
ITEM.width = 3
ITEM.height = 4

ITEM.iconCam = {
	pos = Vector(608.71862792969, 513.38427734375, 403.43737792969),
	ang = Angle(25, 220, 0),
	fov = 2.9411764705882,
}

ITEM.pacData = {
    [1] = {
        ["children"] = {
            [1] = {
                ["children"] = {},
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
                    ["Bone"] = "chest",
                    ["UniqueID"] = "4268442169",
                    ["BoneMerge"] = false,
                    ["EyeTargetUID"] = "",
                    ["Position"] = Vector(-11.041015625, 0.04248046875, -39.119415283203),
                    ["BlendMode"] = "",
                    ["Angles"] = Angle(0, 180, 0),
                    ["Hide"] = false,
                    ["EyeAngles"] = false,
                    ["Scale"] = Vector(1, 1, 1),
                    ["AngleOffset"] = Angle(0, 0, 0),
                    ["EditorExpand"] = false,
                    ["Size"] = 1,
                    ["Color"] = Vector(1, 1, 1),
                    ["ClassName"] = "model2",
                    ["IsDisturbing"] = false,
                    ["ModelModifiers"] = "",
                    ["Model"] = "models/arleitiss/riotshield/shield.mdl"
                }
            }
        },
        ["self"] = {
            ["DrawOrder"] = 0,
            ["UniqueID"] = "3667813756",
            ["AimPartUID"] = "",
            ["Hide"] = false,
            ["Duplicate"] = false,
            ["ClassName"] = "group",
            ["OwnerName"] = "self",
            ["IsDisturbing"] = false,
            ["Name"] = "my outfit",
            ["EditorExpand"] = true
        }
    }
}

-- hook.Add("CanPlayerEquipItem", "EquipShield", function(client, item)
--     -- models/dpfilms/metropolice/hl2concept.mdl
--     if item.class == "swat_shield" and client:IsCombine() then
--         local oldModel = client:GetModel()

--         if SERVER and string.find(oldModel, "pm_") == nil then
--             client:SetData("oldModel", oldModel)
--             local _, indexEnd = string.find(oldModel, ".*/")
--             local shieldModel = string.sub(oldModel, 1, indexEnd) .. "playermodels/pm_" .. string.sub(oldModel, indexEnd + 1)

--             if util.IsValidModel(shieldModel) then
--                 client:SetModel(shieldModel)
--                 client:SetData("shieldModel", shieldModel)
--                 return
--             end
--         else
--             return
--         end
--     end
-- end)

-- hook.Add("PlayerWeaponChanged", "ChangeShield", function(client, weapon)
--     if not IsValid(weapon) or not client:IsCombine() then return end
--     if weapon:GetClass() == "swat_shield" then
--         client:SetModel(client:GetData("shieldModel", client:GetModel()))
--     else
--         client:SetModel(client:GetData("oldModel", client:GetModel()))
--     end
-- end)

-- hook.Add("CanPlayerUnequipItem", "ShieldUnequip", function(client, item)
--     if item.class == "swat_shield" and client:IsCombine() then
--         client:SetModel(client:GetData("oldModel", client:GetModel()))
--         if SERVER then
--             client:SetData("oldModel", nil)
--             client:SetData("shieldModel", nil)
--         end
--     end
-- end)

-- hook.Add("CanPlayerDropItem", "ShieldDrop", function(client, item)
--     if item.class == "swat_shield" and client:IsCombine() then
--         client:SetModel(client:GetData("oldModel", client:GetModel()))
--         if SERVER then
--             client:SetData("oldModel", nil)
--             client:SetData("shieldModel", nil)
--         end
--     end
-- end)

-- hook.Add("CanPlayerUseCharacter", "ShieldChar", function(client, character)
--     if client:HasWeapon("swat_shield") then 
--         return false, "You must unequip your riot shield."
--     end
-- end)

-- hook.Add("OnCharacterDisconnect", "ShieldDisconnect", function(client, character)
--     client:SetModel(client:GetData("oldModel", client:GetModel()))
--     if SERVER then
--         client:SetData("oldModel", nil)
--         client:SetData("shieldModel", nil)
--     end
-- end)

hook.Add("SetupMove", "DisableShieldSprint", function(client, mv, usrmd)
    if not IsValid(client) then return end
    if client:HasWeapon("swat_shield") then
        mv:SetMaxClientSpeed(ix.config.Get("walkSpeed"))
    end
end)