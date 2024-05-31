ITEM.name = "Pear"
ITEM.model = Model("models/foodnhouseholditems/pear.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A ripe pear."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt =  5
ITEM.healthAmt = 2
ITEM.useSound = "npc/headcrab/headbite.wav"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + itemTable.healthAmt, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}