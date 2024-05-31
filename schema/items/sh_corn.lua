ITEM.name = "Corn"
ITEM.model = Model("models/foodnhouseholditems/corn.mdl")
ITEM.width = 2
ITEM.height = 1
ITEM.description = "A fresh ear of corn."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt =  0
ITEM.healthAmt = 2
ITEM.useSound = "npc/barnacle/neck_snap2.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}