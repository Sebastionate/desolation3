ITEM.name = "City 8 Sake"
ITEM.model = Model("models/hlvr/props/bottles/garbage_glassbottle003a.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "An extremely rare vintage bottle of Japanese rice wine, straight from City 8."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 30

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player
        client:SetHealth(math.min(client:Health() + -5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}