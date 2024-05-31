ITEM.name = "Christmas Present"
ITEM.description = "Open me to get your present!"
ITEM.model = "models/katharsmodels/present/type-2/big/present2.mdl"
--[[
    theres also
    - type 2
    - small/normal/big
]]
ITEM.width = 1
ITEM.height = 1

function ITEM:PaintOver(item, w, h)
    surface.SetDrawColor(255, 223, 0, 10)
    surface.DrawRect(0, 0, w, h)
end

local dangerousShit = {
    ["ar2"]                 = true,
    ["rappel_hook"]         = true,
    ["smg1"]                = true,
    ["transfer_card"]       = true,
    ["crossbow"]            = true,
    ["shotgun"]             = true,
    ["combinesniper"]       = true,
    ["permit_consumables"]  = true,
    ["cwu_d"]               = true,
    ["loyalist_clothing"]   = true,
    ["clipboard"]           = true,
    ["hazmat"]              = true,
    ["meme"]                = true,
    ["hazmat2"]             = true,
    ["cwu_l"]               = true,
    ["shield"]              = true,
    ["cmu1"]                = true,
    ["banana_gun"]          = true,
    ["cwu_a"]               = true,
    ["cid"]                 = true,
    ["combinelock"]         = true,
    ["357"]                 = true,
    ["dcharge"]             = true,
    ["ration_loyalist_prestige"] = true,
    ["ration_loyalist_priority"] = true,
    ["ration_coupon"]           = true,
    ["ration_loyalist_superior"] = true,
    ["ration_loyalist_maximum"] = true,
    ["armband_01"] = true,
    ["armband_02"] = true,
    ["armband_03"] = true,
    ["armband_04"] = true,
    ["armband_05"] = true,
    ["armband_06"] = true,
    ["armband_07"] = true,
    ["armband_08"] = true,
    ["armband_09"] = true,
    ["armband_10"] = true,
    ["armband_staff"] = true,
    ["kevlar"] = true,
    ["longrange"] = true,
    ["handheld_radio"] = true,
    ["doorcharge"] = true,
    ["molotov"] = true,
    ["grenade"] = true,
    ["shield"] = true
}

local presentChoices = {}

for id, _ in pairs(ix.item.list) do
    if not dangerousShit[id] then
        table.insert(presentChoices, id)
    end
end

ITEM.functions.use = {
    name = "Open",
    icon = "icon16/accept.png",
    OnRun = function(itemTable)
        local client = itemTable.player
        local item, _ = table.Random(presentChoices)

        ix.item.Spawn(item, client:GetEyeTrace().HitPos)

        return true
    end
}