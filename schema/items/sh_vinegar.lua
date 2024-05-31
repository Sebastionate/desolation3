ITEM.name = "Vinegar"
ITEM.model = Model("models/foodnhouseholditems/fishgolden.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Vinegar is a fermented liquid composed of acetic acid and water, made from almost any carbohydrate source that can undergo fermentation."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = -25
ITEM.thirstAmt = -30

ITEM.useSound = "physics/flesh/flesh_bloody_break.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() - 15, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}