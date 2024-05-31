ITEM.name = "Can of Mountain Dew"
ITEM.model = Model("models/foodnhouseholditems/sodacan06.mdl")
ITEM.description = "A green aluminium can of carbonated and extra caffeinated soda known as Mountain Dew. "
ITEM.category = "Consumables"
ITEM.hungerAmt = 10
ITEM.thirstAmt = 20

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(40)
		client:SetHealth(math.Clamp(client:Health() + 10, 0, client:GetMaxHealth()))
		client:EmitSound("eating_and_drinking/can.wav", 75, 100, 0.50)
		
		client:GetCharacter():GetInventory():Add("can", 1)
	end
}