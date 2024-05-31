// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.

local PLUGIN = PLUGIN

local constantTable = {
    s = 1,          -- seconds
    m = 60,         -- minutes
    h = 3600,       -- hours
    d = 86400,      -- days
    w = 604800,     -- weeks
    n = 2592000,    -- months
    y = 31536000    -- years
}

function PLUGIN:LengthToSeconds(length)
    local constant = length:sub(-1)
    local multiplier = length:sub(1, -2)

    return tonumber(multiplier) * tonumber(constantTable[constant])
end

function PLUGIN:GiveTempFlags(target, flags, time)
    local plyFlagsPlugin = ix.plugin.Get("playerflags")

    local length = time:match("(%d+[smhdwny])")

    if not length then
        return "Invalid length!"
    end

    local timestamp = os.time() + PLUGIN:LengthToSeconds(length)
    local date = os.date("%d/%m/%Y", timestamp)

    plyFlagsPlugin:GivePlayerFlags(target, flags)
    
    target:SetData("tempFlags", flags)
    target:SetData("tempFlagsExpire", timestamp)

    ix.util.Notify(string.format(
        "%s has donated and received '%s' flags until: %s",
        target:Name(),
        flags,
        date
    ))
end

function PLUGIN:GiveFlags(target, flags)
    local plyFlagsPlugin = ix.plugin.Get("playerflags")

    plyFlagsPlugin:GivePlayerFlags(target, flags)

    ix.util.Notify(string.format(
        "%s has donated and received permanent '%s' flags.",
        target:Name(),
        flags
    ))
end

local donatorPackages = {
    // Tier 1 Donator
    ["tier1"] = function(ply, steamId)
        print("[DONATIONS] Gave Tier 1 donator to " .. ply:GetName())
        ix.log.AddRaw("[DONATIONS] Gave Tier 1 donator to " .. ply:GetName())
    
        RunConsoleCommand("ulx", "adduserid", steamId, "donator")
        ply:SetWhitelisted(ix.faction.teams["synth"].index, true)
        PLUGIN:GiveTempFlags(ply, "Ppetw", "1n")
    end,
    // Tier 2 Donator
    ["tier2"] = function(ply, steamId)
        print("[DONATIONS] Gave Tier 2 donator to " .. ply:GetName())
        ix.log.AddRaw("[DONATIONS] Gave Tier 2 donator to " .. ply:GetName())
    
        RunConsoleCommand("ulx", "adduserid", steamId, "donator2")
        RunConsoleCommand("ix", "CharGiveItem", steamId, "coupon", 3)
        ply:SetWhitelisted(ix.faction.teams["synth"].index, true)
        PLUGIN:GiveTempFlags(ply, "Ppetw", "1n")
    end,
    // Permanent donator
    ["permanent"] = function(ply, steamId)
        print("[DONATIONS] Gave Permanent donator to " .. ply:GetName())
        ix.log.AddRaw("[DONATIONS] Gave Permanent donator to " .. ply:GetName())
    
        RunConsoleCommand("ulx", "adduserid", steamId, "donator2")
        RunConsoleCommand("ix", "CharGiveItem", steamId, "coupon", 3)
        ply:SetWhitelisted(ix.faction.teams["synth"].index, true)
        PLUGIN:GiveFlags(ply, "Ppetw")
    end
}

timer.Create("ixDonatorTick", 1, 0, function()
    local query = mysql:Select("aurora_donator")
        query:Select("id")
        query:Select("steamid")
        query:Select("tier")
        query:Where("given", 0)
        query:Callback(function(result)
            for _, v in pairs(result) do
                local ply = player.GetBySteamID64(v.steamid)

                // garry you are fucking autistic
                if type(ply) == "boolean" then continue end

                if !IsValid(ply) then continue end
                if !ply.GetCharacter || !ply:GetCharacter() then continue end

                local donatorPackage = donatorPackages[v.tier]
                if not donatorPackage then
                    print("[DONATIONS] Something went horribly wrong.")
                    return
                end

                donatorPackage(ply, util.SteamIDFrom64(v.steamid))

                local query = mysql:Update("aurora_donator")
                    query:Where("id", v.id)
                    query:Update("given", 1)
                query:Execute()
            end
        end)
    query:Execute()

    local query = mysql:Select("aurora_donator")
        query:Select("id")
        query:Select("steamid")
        query:Where("taken", 0)
        query:WhereLT("expires", os.time())
        query:WhereNotEqual("expires", 0)
        query:Callback(function(result)
            for _, v in pairs(result) do
                local userInfo = ULib.ucl.getUserInfoFromID(util.SteamIDFrom64(v.steamid))

                // only remove if they are still donator
            if userInfo != nil then
                if (string.find(userInfo.group, "donator")) then
                    RunConsoleCommand("ulx", "removeuserid", util.SteamIDFrom64(v.steamid))
                end
            end

                ix.log.AddRaw("[DONATIONS] " .. util.SteamIDFrom64(v.steamid) .."'s donator has expired.")

                local query = mysql:Update("aurora_donator")
                    query:Where("id", v.id)
                    query:Update("taken", 1)
                query:Execute()
            end
        end)
    query:Execute()
end)