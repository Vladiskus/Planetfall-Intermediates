local parts = require("variable-parts")

if parts.brass and not parts.brassExternal then
    require("brass.data-updates")
end

if parts.nickel and not parts.nickelExternal then
    require("nickel.data-updates")
end

if parts.gold and not parts.goldExternal then
    require("gold.data-updates")
end

if parts.sulfur and not parts.sulfurExternal then
    require("sulfur.data-updates")
end

if parts.laser and not parts.laserExternal then
    require("laser.data-updates")
end