PLUGIN.name = "TFA Support"
PLUGIN.author = "wildflowericecoffee"
PLUGIN.description = "Adds support for TFA weapons."

if CLIENT then
    local SWEP = weapons.GetStored("tfa_gun_base")
    hook.Remove("ContextMenuOpen", "TFAContextBlock")
    hook.Remove("Think", "TFAInspectionMenu")
    hook.Add("TFA_DrawCrosshair", "TFARemoveCrosshair", function(wep, x, y)
        return true
    end)
end