ITEM.name = "Lettuce Serving"
ITEM.model = Model("models/props_junk/garbage_metalcan001a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A few leafs of lettuce"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 1
ITEM.thirstAmt =  0
ITEM.healthAmt = 0
ITEM.useSound = "npc/headcrab/headbite.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}