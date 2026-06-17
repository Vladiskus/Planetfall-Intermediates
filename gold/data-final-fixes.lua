local rm = require("recipe-modify")
local parts = require("variable-parts")

local allowed_recipes = {
  parts.k2 and "nitric-acid-early" or "nitric-acid",
  "integrated-circuit",
  "transceiver",
  "advanced-cable",
  "hv-power-regulator",
}

for k, v in pairs(allowed_recipes) do
  if data.raw.recipe[v] then
    data.raw.recipe[v].allow_productivity = true
  end
end

if mods["LunarLandings"] then
  --LL hard-overrides the satellite recipe in DFF.
  rm.ReplaceIngredient("satellite", "advanced-circuit", "transceiver", 20)
end

require("gold.compat.final")
