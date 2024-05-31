ITEM.name = "Medical Trash"
ITEM.description = "Medical related junk. Empty packaging after medicine. Seemingly useless."
ITEM.model = "models/illusion/eftcontainers/medpile.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
    pos = Vector(-22.65, -19.78, 733.46),
    ang = Angle(92.35, 221.09, 0),
    fov = 0.68
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into X, Y, Z, LMNOP")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end
