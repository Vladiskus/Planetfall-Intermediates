local parts = require("variable-parts")

if parts.brass and not mods["BrassTacks-Updated"] and not mods["BrassTacks"] then
    require("brass.data-final-fixes")
end

if parts.nickel and not mods["IfNickel-Updated"] and not mods["IfNickel"] then
    require("nickel.data-final-fixes")
end