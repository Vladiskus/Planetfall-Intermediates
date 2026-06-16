local rm = require("recipe-modify")
local parts = require("variable-parts")
local tf = require("techfuncs")

local allowed_recipes = {
  "bolted-flange",
  "brass-balls",
  "bearing",
  "airtight-seal",

  "flywheel",
  "articulated-mechanism",
  "hardened-hull",
  "complex-joint",
  parts.gyroscope,

  "complex-joint-iridium",
  "hardened-hull-iridium",
  "airtight-seal-vitalic",

  mods["Krastorio2"] and "gearbox" or nil,
  mods["Krastorio2"] and "gearbox-iridium" or nil,
  mods["Krastorio2"] and "advanced-gearbox" or nil,
}
--brass precursor not included to avoid "double dipping"
--relatively little brass is needed in the grand scheme, being able to get +40% for relatively cheap is overkill
--(prodmods in furnaces being generally worse than prodmods in assemblers)

for k, v in pairs(allowed_recipes) do
  if data.raw.recipe[v] then
    data.raw.recipe[v].allow_productivity = true
  end
end

require("compat.final")

--for k, v in pairs(data.raw.recipe) do
--  rm.ReplaceProportional(k, "brass-pipe-fitting", "bolted-flange", 1)
--end
--you may think this would give other mods the chance to update but really this would create extra work for multiple version checking and etc.
