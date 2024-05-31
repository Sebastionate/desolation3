
ITEM.name = "Request Device"
ITEM.model = Model("models/gibs/shield_scanner_gib1.mdl")
ITEM.description = "A box with rounded corners, housing two buttons."
ITEM.price = 20

if CLIENT then
    net.Receive("ixRequestDevice", function()
        Derma_StringRequest("Request", "Make a request through the device.", "", function(text)
            RunConsoleCommand("ix", "request", text)
        end)
    end)
else
    util.AddNetworkString("ixRequestDevice")
end

ITEM.functions.Request = {
    OnRun = function(itemTable)
        net.Start("ixRequestDevice")
        net.Send(itemTable.player)

        return false
	end
}