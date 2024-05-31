ITEM.name = "UU-Approved Pickle Jar"
ITEM.model = Model("models/bioshockinfinite/dickle_jar.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A fancy jar of dill pickles, stamped with a UU-Approved sticker. While juicy, they don't carry as much flavor as expected."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 20
ITEM.thirstAmt = 20

ITEM.useSound = "physics/flesh/flesh_bloody_break.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}