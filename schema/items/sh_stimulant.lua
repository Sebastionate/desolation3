ITEM.name = "Stimulant Dose"
ITEM.model = "models/carlsmei/escapefromtarkov/medical/morphine.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-732.81, 34.97, -24.85),
	ang = Angle(-1.94, -2.73, 0),
	fov = 0.38
}
ITEM.description = "A Combine produced combat stimulant that numbs pain and dramatically boosts epinephrine production. Also known as a stim-boost or stim-dose."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		client:SetHealth(math.min(client:Health() + 15, client:GetMaxHealth()));
		client:RestoreStamina(75)
	end
}
