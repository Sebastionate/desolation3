ITEM.name = "Raw Fish"
ITEM.model = Model("models/foodnhouseholditems/fishgolden.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bright-scaled fish, raw and uncooked. It'd emit a putrid smell. Eating it raw would most definitely make you sick."
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