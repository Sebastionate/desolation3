ITEM.name = "Moonshine"
ITEM.model = Model("models/props_junk/glassjug01.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Homebrewn moonshine captured in a large transparent jug."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 35

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Drink = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + -35, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}