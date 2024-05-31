// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.


local PLUGIN = PLUGIN

PLUGIN.name = "Crafting Spawners"
PLUGIN.author = "made by liquid, ratfucked by |Milk-Chan|"
PLUGIN.description = "spawners"

if CLIENT then
    CreateConVar("ix_spawners_observer", "0", FCVAR_ARCHIVE)
    
    function PLUGIN:PostDrawTranslucentRenderables(depth, skybox)
        if depth or skybox then return end

        if !LocalPlayer():IsAdmin() or LocalPlayer():IsUserGroup("event manager") or LocalPlayer():GetMoveType() != MOVETYPE_NOCLIP then return end

        local spawnerESP = GetConVar("ix_spawners_observer")
        if not spawnerESP:GetBool() then return end

        for _, v in pairs(ents.FindByClass("craftspawn*")) do
            local min, max = v:WorldSpaceAABB()

            render.DrawWireframeBox(min, Angle(), Vector(0, 0, 0), max - min, Color(253,145,248, 255), false)
        end
    end
end