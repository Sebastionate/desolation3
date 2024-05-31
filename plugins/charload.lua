local PLUGIN = PLUGIN
PLUGIN.name = "Character Cooldown"
PLUGIN.author = "liquid"
PLUGIN.description = "Adds a cooldown for switching characters."

ix.config.Add("charSwitchCooldown", ix.config.Get("charSwitchCooldown", 30), "The cooldown in seconds for switching characters", nil, {
    data = {min = 0, max = 300},
	category = "Chat"
})

function PLUGIN:CanPlayerUseCharacter(client, character)
    if client:IsAdmin() then return end

    client.lastCharSwitch = client.lastCharSwitch or 0

    local deltaT = CurTime() - client.lastCharSwitch
    local cooldown = ix.config.Get("charSwitchCooldown")

    if deltaT < cooldown then 
        return false, string.format(
            "You must wait %d more seconds to switch characters!", 
            cooldown - deltaT
        )
    end

    client.lastCharSwitch = CurTime()
end