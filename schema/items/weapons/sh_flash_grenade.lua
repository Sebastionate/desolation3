ITEM.name = "Flash Grenade"
ITEM.description = "A less-lethal explosive device used to temporarily disorient an enemy's senses."
ITEM.model = "models/weapons/w_eq_flashbang.mdl"
ITEM.class = "cw_flash_grenade"
ITEM.weaponCategory = "grenade"
ITEM.classes = {}
--ITEM.flag = "V"
ITEM.width = 1
ITEM.height = 1
ITEM.isGrenade = false
ITEM.price = 50

ITEM.functions.Equip = {
    name = "Equip",
    tip = "equipTip",
    icon = "icon16/tick.png",
    OnRun = function(item)
        local frag = ents.Create("cw_flash_grenade")
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