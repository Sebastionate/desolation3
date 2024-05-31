ITEM.name = "Black Lace"
ITEM.model = "models/carlsmei/escapefromtarkov/medical/zagustin.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(724.76, 113.4, 27.19),
	ang = Angle(2.13, 188.87, 0),
	fov = 0.41
}
ITEM.description = "A resistance produced drug that dehydrates, but offers an increased athletic ability."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		client:RestoreStamina(200);
		client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
	end
}
