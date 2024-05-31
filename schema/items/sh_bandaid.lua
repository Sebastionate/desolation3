
ITEM.name = "Bandage"
ITEM.model = "models/carlsmei/escapefromtarkov/medical/bandage_med.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(1.98, -131.76, 4.98),
	ang = Angle(2.15, 90.88, 0),
	fov = 4.3
}
ITEM.description = "A roll of combat gauze. Sterile."
ITEM.category = "Medical"
ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		client:SetHealth(math.min(client:Health() + 20, 100))
	end
}
