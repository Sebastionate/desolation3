ITEM.name = "Rum"
ITEM.model = Model("models/foodnhouseholditems/winebottle2.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A large rounded brown bottle full of rum."
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