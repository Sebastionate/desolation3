ITEM.name = "Roasted Antlion Meat"
ITEM.model = Model("models/gibs/antlion_gib_small_2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A slab of roasted antlion meat."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 30
ITEM.thirstAmt = -10
ITEM.useSound = "npc/headcrab/headbite.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}