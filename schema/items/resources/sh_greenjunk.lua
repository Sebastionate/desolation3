ITEM.name = "Container of Biogel"
ITEM.description = "Biogel used to fill Combine medical vials. /Might/ be edible."
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-109.18, -725.48, -25.63),
	ang = Angle(-2, 81.44, 0),
	fov = 0.64
}


ITEM.functions.Consume = {
	sound = "npc/barnacle/barnacle_gulp2.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 5, client:GetMaxHealth()))
		client:EmitSound("ambient/voices/cough2.wav", 75, 90, 0.35)
	end
}

ITEM.category = "Medical"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This is a base item. It can not be broken down any further.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end