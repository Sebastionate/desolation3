
ITEM.name = "Biogel Vial"
ITEM.model = "models/healthvial.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(731.52, 19.73, 69),
	ang = Angle(4.98, 181.56, 0),
	fov = 0.45
}
ITEM.description = "A small vial filled with Combine produced biogel. Hemostatic, disinfectant, and painkiller all in one."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		client:SetHealth(math.min(client:Health() + 25, client:GetMaxHealth()))
	end
}
