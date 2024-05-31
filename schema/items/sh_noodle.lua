ITEM.name = "Noodles"
ITEM.model = Model("models/mosi/fallout4/props/food/noodles.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A batch of fresh noodles"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 5
ITEM.thirstAmt =  -5
ITEM.healthAmt = 1
ITEM.useSound = "npc/barnacle/neck_snap2.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}