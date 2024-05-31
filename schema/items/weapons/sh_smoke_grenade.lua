ITEM.name = "Smoke Grenade"
ITEM.description = "Used as a signaling device or as a screening device for unit movements."
ITEM.model = "models/weapons/w_eq_smokegrenade.mdl"
ITEM.class = "cw_smoke_grenade"
ITEM.weaponCategory = "grenade"
ITEM.classes = {}
--ITEM.flag = "V"
ITEM.width = 1
ITEM.height = 1
ITEM.isGrenade = false
ITEM.price = 40

ITEM.functions.Equip = {
    name = "Equip",
    tip = "equipTip",
    icon = "icon16/tick.png",
    OnRun = function(item)
        local frag = ents.Create("cw_smoke_grenade")
        frag:SetPos(item.player:GetPos())
        frag:Spawn()
        return true
    end,
    OnCanRun = function(item)
        local client = item.player
        return !IsValid(item.entity) and IsValid(client) and item:GetData("equip") ~= true and
            hook.Run("CanPlayerEquipItem", client, item) ~= false and item.invID == client:GetCharacter():GetInventory():GetID()
    end
}