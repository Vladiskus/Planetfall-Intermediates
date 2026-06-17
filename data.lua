local parts = require("variable-parts")

if parts.brass and not parts.brassExternal then
    require("brass.data")
end

if parts.nickel and not parts.nickelExternal then
    require("nickel.data")
end

if parts.gold and not parts.goldExternal then
    require("gold.data")
end

if parts.sulfur and not parts.sulfurExternal then
    require("sulfur.data")
end

if parts.laser and not parts.laserExternal then
    require("laser.data")
end