ITEM.name = "Pipe"
ITEM.description = "Boutta lay some pipe, eh?"
ITEM.model = "models/props_canal/mattpipe.mdl"
ITEM.class = "weapon_hl2pipe"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-4.38, -199.9, -25.72),
	ang = Angle(186.37, -91.27, 0),
	fov = 5.11
}

COLOR_SERVER = Color(175, 71, 84,255)

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 1x Metal Pipe")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end