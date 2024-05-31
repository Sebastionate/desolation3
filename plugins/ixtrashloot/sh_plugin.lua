local PLUGIN = PLUGIN

PLUGIN.name = "Lootable Trash"
PLUGIN.description = "Allows you to loot certin crates to obtain loot items."
PLUGIN.author = "Riggs Mackay"
PLUGIN.schema = "Any"
PLUGIN.license = [[
Copyright 2022 Riggs Mackay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- doubled the items in the table so that they are more common than anything else. If you get what I mean.
PLUGIN.randomLoot = {}
PLUGIN.randomLoot.common = {
	"aa",
    "casing",
    "civcb",
    "clothp",
    "medtrash",
    "nuts",
    "piping",
    "plasticp",
    "steelp",
    "ducttape",
    "woodp",
    "woods",
    "ledbk",
    "bolts",
    "powerbank",
    "wires",
    "gunpowder",
    "plastics",
    "cloth",
    "shell"
}

PLUGIN.randomLoot.rare = {
	"ar2cart",
    "milbat",
    "milcb",
    "steels",
    "powersupp",
    "kevlar",
    "gunparts",
    "gunparts",
    "gunparts",
    "led",
    "greenjunk"
}

ix.util.Include("sv_plugin.lua")

if ( CLIENT ) then
    function PLUGIN:PopulateEntityInfo(ent, tooltip)
        local ply = LocalPlayer()
        local ent = ent:GetClass()

        if ( ply:IsCombine() or ply:IsDispatch() ) then
            return false
        end

        if not ( ent:find("ix_loottrash") ) then
            return false
        end

        local title = tooltip:AddRow("loot2")
        title:SetText("Lootable Trash")
        title:SetImportant()
        title:SizeToContents()
    end
end
