ITEM.name = "Apple Juice"
ITEM.model = Model("models/foodnhouseholditems/juicesmall.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A small carton full of apple juice, fitted with a tiny plastic straw."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 15
ITEM.thirstAmt = 25
ITEM.price = 7

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(50)
		client:EmitSound("eating_and_drinking/drinking.wav", 75, 100, 0.50)

		client:GetCharacter():GetInventory():Add("bottlewaterempty", 1)
	end
}