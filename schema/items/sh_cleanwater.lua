ITEM.name = "Clean Water"
ITEM.model = Model("models/hlvr/props/bottles/plastic_bottle_1.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "Purified drinking water. Safe to drink."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt =  30
ITEM.healthAmt = 5
ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"

ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}