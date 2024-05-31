// # Copyright © George Mar - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by George Mar <gm1003.gm@gmail.com>, July 2021.

local PLUGIN = PLUGIN
PLUGIN.name = "Character Lock"
PLUGIN.author = "gm1003 ツ"
PLUGIN.description = "Adds commands for preventing players from switching characters."

function PLUGIN:CanPlayerUseCharacter(client, character)
    if client:IsAdmin() or client:IsUserGroup("moderator") then return end

    if client.charLock then return false, "You cannot switch characters right now!" end
end

ix.command.Add("CharLock", {
    description = "Locks a character from switching.",
    adminOnly = true,
    arguments = ix.type.character,
    OnRun = function(self, client, target)
        target:GetPlayer().charLock = true

        return string.format("Locked %s from switching characters.", target:GetName())
    end
})

ix.command.Add("CharUnlock", {
    description = "Unlocks a character from switching.",
    adminOnly = true,
    arguments = ix.type.character,
    OnRun = function(self, client, target)
        target:GetPlayer().charLock = false

        return string.format("Unlocked %s from switching characters.", target:GetName())
    end
})

ix.command.Add("CharLockAll", {
    description = "Locks all characters from switching.",
    adminOnly = true,
    OnRun = function(self, client)
        for _, ply in ipairs(player.GetAll()) do
            ply.charLock = true
        end

        return "Locked all characters from switching."
    end
})

ix.command.Add("CharUnlockAll", {
    description = "Unlocks all characters from switching.",
    adminOnly = true,
    OnRun = function(self, client)
        for _, ply in ipairs(player.GetAll()) do
            ply.charLock = false
        end

        return "Unlocked all characters from switching."
    end
})
