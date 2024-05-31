ITEM.name = "City 17 Vodka"
ITEM.model = Model("models/hlvr/props/bottles/bottle_vodka.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "An extremely rare vintage bottle of vodka, imported straight from City 17."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 25

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -10, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}