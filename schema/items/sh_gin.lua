ITEM.name = "Gin"
ITEM.model = Model("models/hlvr/props/bottles/bottle_o_gin.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "An illicit green bottle of strong Chatka Gin."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 30

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -10, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}