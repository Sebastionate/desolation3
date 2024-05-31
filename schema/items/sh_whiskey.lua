ITEM.name = "Whiskey"
ITEM.model = Model("models/props_junk/garbage_glassbottle002a.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A tall bottle of Whiskey, covered with a tattered brown bag."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 20

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}