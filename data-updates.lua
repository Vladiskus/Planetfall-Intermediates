local parts = require("variable-parts")

if parts.brass and not mods["BrassTacks-Updated"] and not mods["BrassTacks"] then
    require("brass.data-updates")
end

if parts.nickel and not mods["IfNickel-Updated"] and not mods["IfNickel"] then
    require("nickel.data-updates")
end

if parts.gold and not mods["ThemTharHills-Updated"] and not mods["ThemTharHills"] then
    require("gold.data-updates")
end