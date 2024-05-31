ITEM.name = "UU-Approved Black Tea"
ITEM.model = Model("models/bioshockinfinite/ebsinthebottle.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A tall, durable bottle of Black Tea."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 45

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}