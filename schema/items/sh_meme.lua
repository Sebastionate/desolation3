ITEM.name = "Meal for Two"
ITEM.model = Model("models/foodnhouseholditems/mcdmeal.mdl")
ITEM.description = "A McDonalds meal tray equipped with two McDonalds Big Macs, both fitted with three slices of bread, two 100%% beef patties, two slices of American cheese and loaded with various add-ins like tomatoes, pickles, mustard, ketchup. And the sauce. It's accompanied by two large McFries, both heavily salted, and two McChicken wings, hot from the fryer. One McDonalds Large Cup is filled to the brim with Code Red Mountain Dew, and the other is filled with Sweet Tea, half and half."
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 100
ITEM.thirstAmt = 100

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player
        client:SetHealth(math.min(client:Health() + 100, client:GetMaxHealth()))
        client:EmitSound("npc/barnacle/barnacle_gulp2.wav", 75, 90, 0.50)

        local snd = {"02", "03", "04", "05"}

        timer.Simple(2, function()
            client:EmitSound("vo/npc/male01/moan" .. tostring(snd[math.random(1, #snd)]) .. ".wav", 75, 100, 0.60)

        end)

    end
}



