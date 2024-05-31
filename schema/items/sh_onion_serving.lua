ITEM.name = "Onion Serving"
ITEM.model = Model("models/props_junk/garbage_metalcan001a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A few pieces of a bitter white onion."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 2
ITEM.thirstAmt =  0
ITEM.useSound = "npc/barnacle/neck_snap2.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}