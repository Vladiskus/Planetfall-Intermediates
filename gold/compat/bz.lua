local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")
local cu = require("category-utils")

if parts.bz.gold then

  --small amount relative to cost of ICs but idk
  rm.RemoveIngredient("cpu", "silicon-wafer", 10)
  rm.RemoveIngredient("cpu", parts.k2 and "kr-silicon" or "silicon", 5)

  if data.raw.item["gimbaled-thruster"] then
    --rcu is getting a bit overcrowded and the temp sensor should be in the part of the rocket that might plausibly overheat anyway
    --rm.RemoveIngredient("rocket-control-unit", "temperature-sensor", 99999)
    if mods["space-exploration"] then
      rm.AddIngredient("gimbaled-thruster", "temperature-sensor", 1)
    else
      rm.AddIngredient("gimbaled-thruster", "temperature-sensor", 2)
    end
  end

  if data.raw.item["temperature-sensor"] and not data.raw.item["cooling-fan"] then
    rm.AddIngredient("hv-power-regulator", "temperature-sensor")
    tf.addPrereq("high-voltage-equipment", "temperature-regulation")
  end
  
  if mods["space-exploration"] then

    if data.raw.item["rich-copper-ore"] then
      --add a bad way to make rich copper ore on nauvis to prevent deadlock
      --this is an ill-considered giant hammer solution and probably sucks!
      --then again it is making the already-not-great recipe more viable by adding extra products
      rm.AddProductRaw("depleted-acid-treatment", {type="item", name="rich-copper-ore", amount=1, probability=0.05})
    end
    tf.removeSciencePack("platinum-processing", "se-rocket-science-pack")
    tf.removePrereq("platinum-processing", "se-rocket-science-pack")
    tf.addPrereq("platinum-processing", "chemical-science-pack")
    tf.removeSciencePack("palladium-processing", "se-rocket-science-pack")
    tf.removeSciencePack("temperature-regulation", "se-rocket-science-pack")
    tf.removePrereq("palladium-processing", "se-rocket-science-pack")
    tf.addPrereq("palladium-processing", "chemical-science-pack")

    tf.removeRecipeUnlock("se-space-data-card", "se-empty-data-gold")
  end
end

if parts.bz.aluminum then
  tf.addPrereq("high-voltage-equipment", "reinforced-cable")
end
