ITEM.name = "Champagne"
ITEM.model = Model("models/foodnhouseholditems/champagne2b.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "An exquisite bottle of vintage 1969 Champagne Blêuter'd."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 25

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}