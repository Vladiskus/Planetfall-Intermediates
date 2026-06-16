local parts = require("variable-parts")

if parts.brass and not mods["BrassTacks-Updated"] and not mods["BrassTacksMk2"] then
    require("brass.data-final-fixes")
end

if parts.nickel and not mods["IfNickel-Updated"] and not mods["IfNickelMk2"] then
    require("nickel.data-final-fixes")
end

if parts.gold and not mods["ThemTharHills-Updated"] and not mods["ThemTharHillsMk2"] then
    require("gold.data-final-fixes")
end

if parts.sulfur and not mods["BrimStuff-Updated"] and not mods["BrimStuffMk2"] then
    require("sulfur.data-final-fixes")
end