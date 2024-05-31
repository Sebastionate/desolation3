ITEM.name = "Can of Pepsi"
ITEM.model = Model("models/foodnhouseholditems/sodacan04.mdl")
ITEM.description = "A blue aluminium can of carbonated soda known as Pepsi. Despite being branded, it is adorned with a Union logo."
ITEM.category = "Consumables"
ITEM.hungerAmt = 5
ITEM.thirstAmt = 25

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(30)
		client:SetHealth(math.Clamp(client:Health() + 10, 0, client:GetMaxHealth()))
		client:EmitSound("eating_and_drinking/can.wav", 75, 100, 0.50)
		
		client:GetCharacter():GetInventory():Add("can", 1)
	end
}
