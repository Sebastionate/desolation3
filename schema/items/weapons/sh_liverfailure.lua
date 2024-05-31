ITEM.name = "Heart Carver"
ITEM.description = "An old, rusted, overly sharpened meathook covered in dry bloodstains and scratches. What looks to have been carved initials on the side are no longer legible. It emanates a hopeless aura."
ITEM.model = "models/props_borealis/meathook01.mdl"
ITEM.class = "weapon_hl2hook"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(-4.38, -199.9, -25.72),
	ang = Angle(186.37, -91.27, 0),
	fov = 5.11
}


function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("IM GUNNA HURT YOU!")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end