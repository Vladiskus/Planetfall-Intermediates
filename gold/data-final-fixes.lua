local rm = require("recipe-modify")

local allowed_recipes = {
  mods["Krastorio2"] and "nitric-acid-early" or "nitric-acid",
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
