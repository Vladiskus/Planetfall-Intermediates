local parts = require("variable-parts")

local allowed_recipes = {
  "motor", --aai electric motor already prodmoddable
  "invar-valve",
  parts.motor .. "-silver",

  "motorized-articulator",
  "flow-controller",
  "cooling-fan",
  "gimbaled-thruster",
  "nickel-electromagnet",
  "advanced-flow-controller",

  "flow-controller-biological",
  "advanced-flow-controller-biological",
  "self-regulating-valve"
}

for k, v in pairs(allowed_recipes) do
  if data.raw.recipe[v] then
    data.raw.recipe[v].allow_productivity = true
  end
end

require("nickel.compat.final")