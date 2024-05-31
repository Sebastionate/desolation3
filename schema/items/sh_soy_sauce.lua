ITEM.name = "Soy Sauce"
ITEM.model = Model("models/foodnhouseholditems/winebottle1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Soy sauce is a liquid condiment traditionally made from a fermented paste of soybeans, roasted grain, brine, and Aspergillus oryzae or Aspergillus sojae molds"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = -0
ITEM.thirstAmt = -65

ITEM.useSound = "physics/flesh/flesh_bloody_break.wav"
ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() - 8, client:GetMaxHealth()))
        client:EmitSound(itemTable.useSound, 75, 115, 0.45)

        return true
    end
}