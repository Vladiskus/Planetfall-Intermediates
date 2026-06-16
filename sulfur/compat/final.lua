local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")
local cu = require("category-utils")

local gasket = "rubber"
local gasket_cost = 2
if parts.bz.carbon and not mods["BrassTacks-Updated"] then
  gasket = "gasket"
  gasket_cost = 1
end

if mods["space-exploration"] then
  if not mods["BrassTacks-Updated"] then
    rm.AddIngredient("se-vulcanite-rocket-fuel", gasket, gasket_cost)
  end
end

if not mods["Krastorio2"] and not mods["space-exploration"] then
  cu.moveRecipe("sulfuric-acid", "advanced-chemicals", "a")
  cu.moveRecipe("nitric-acid", "advanced-chemicals", "b")
  cu.moveRecipe("nitric-acid-early", "advanced-chemicals", "b2")
  cu.moveRecipe("hydrogen-chloride-pure", "advanced-chemicals", "c")
  cu.moveRecipe("hydrogen-chloride-salt", "advanced-chemicals", "d")
  cu.moveRecipe("vinyl-chloride", "advanced-chemicals", "e")
  cu.moveRecipe("chlorine", "advanced-chemicals", "f")
  cu.moveRecipe("epoxy", "advanced-chemicals", "g")
  cu.moveRecipe("organotins", "advanced-chemicals", "h")
end

if mods["space-exploration"] then
  cu.moveGroup("brimstuff-botany", "resources", "a-d-a")
  cu.moveGroup("waste-treatment", "resources", "a-d-ab")

  cu.moveItem("toluene", "fuel", "z")
end
