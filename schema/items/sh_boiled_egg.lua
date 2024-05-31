ITEM.name = "Boiled Egg"
ITEM.model = Model("models/foodnhouseholditems/egg.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A boiled egg. Safe to eat."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 20
ITEM.thirstAmt =  0
ITEM.healthAmt = 0
ITEM.useSound = "npc/barnacle/neck_snap2.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}