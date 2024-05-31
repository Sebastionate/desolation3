ITEM.name = "Absinthe"
ITEM.model = Model("models/hlvr/props/bottles/garbage_glassbottle003a.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "An old green bottle of Absinthe, with the sticker worn off."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 25

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -20, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}