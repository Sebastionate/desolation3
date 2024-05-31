ITEM.name = "Pickle Jar"
ITEM.model = Model("models/foodnhouseholditems/picklejar.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A large jar of illicit dill pickles. A little old, but vibrant in taste."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 25

ITEM.useSound = "physics/flesh/flesh_bloody_break.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}