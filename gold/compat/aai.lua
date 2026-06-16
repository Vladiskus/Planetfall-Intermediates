local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")
local cu = require("category-utils")

if mods["aai-containers"] and not data.raw.item["tracker"] then
  rm.ReplaceProportional("aai-strongbox-passive-provider", "electronic-circuit", "transceiver", 1/4)
  rm.ReplaceProportional("aai-storehouse-passive-provider", "electronic-circuit", "transceiver", 1/5)
  rm.ReplaceProportional("aai-warehouse-passive-provider", "electronic-circuit", "transceiver", 1/5)
end

if mods["aai-signal-transmission"] then
  rm.AddIngredient("aai-signal-sender", "transceiver", 10)
  rm.AddIngredient("aai-signal-receiver", "transceiver", 10)
end

if mods["aai-industry"] then
  rm.AddIngredient("area-mining-drill", "hv-power-regulator", 1)
end

if mods["space-exploration"] then

  if data.raw.item["nickel-electromagnet"] then
    rm.ReplaceProportional("nickel-electromagnet", "copper-cable", "advanced-cable", 1/4)
    tf.removePrereq("nickel-electromagnet", "chemical-science-pack")
    tf.addPrereq("nickel-electromagnet", "high-voltage-equipment")
  else
    rm.AddIngredient("se-space-particle-accelerator", "advanced-cable", 40)
    rm.AddIngredient("se-space-particle-collider", "advanced-cable", 100)
    rm.AddIngredient("se-space-plasma-generator", "advanced-cable", 40)
    rm.AddIngredient("se-space-electromagnetics-laboratory", "advanced-cable", 40)

    rm.RemoveIngredient("se-space-pipe", "copper-cable", 2)
    rm.AddIngredient("se-space-pipe", "advanced-cable", 1) -- plasma containment
    rm.AddIngredient("se-space-transport-belt", "advanced-cable", 1)
    rm.AddIngredient("se-space-rail", "advanced-cable", 10) -- batch of 100
    rm.ReplaceIngredient("se-energy-beam-defence", "copper-plate", "advanced-cable", 200)
  end

  if data.raw.item["skyseeker-armature"] then
    tf.removePrereq("skyseeker-armature", "se-rocket-science-pack")
    tf.addPrereq("skyseeker-armature", "processing-unit")
    rm.AddIngredient("skyseeker-armature", "integrated-circuit", parts.bz.gold and 1 or 2)
  end

  rm.ReplaceProportional("se-empty-data", "copper-plate", "integrated-circuit", 1/2)
  rm.ReplaceProportional("se-machine-learning-data", "electronic-circuit", "integrated-circuit", 1/2)

  if data.raw.item["advanced-flow-controller"] then
    rm.ReplaceProportional("advanced-flow-controller-biological", "advanced-circuit", "integrated-circuit", 1)
  end

  rm.AddIngredient("se-rocket-launch-pad", "hv-power-regulator", 50)

  rm.AddIngredient("se-electric-boiler", "advanced-cable", 10)
  rm.AddIngredient("se-electric-boiler", "hv-power-regulator", 1)
  rm.RemoveIngredient("se-electric-boiler", "copper-plate", 200)

  rm.AddIngredient("se-space-assembling-machine", "hv-power-regulator", 1)

  rm.ReplaceProportional("se-space-radiator", "copper-cable", "advanced-cable", 1/4)

  if not mods["Krastorio2"] then
    rm.ReplaceProportional("se-cryonite-ion-exchange-beads", "sulfuric-acid", "nitric-acid", 1)
  end

  rm.AddIngredient("se-dynamic-emitter", "transceiver", 1)
  rm.ReplaceProportional("se-conductivity-data", "copper-plate", "advanced-cable", 1/4)

  rm.ReplaceIngredient("se-observation-frame-blank", "light-oil", mods["Krastorio2"] and "kr-nitric-acid" or "nitric-acid", 10)
  rm.ReplaceIngredient("se-observation-frame-blank-beryllium", "light-oil", mods["Krastorio2"] and "kr-nitric-acid" or "nitric-acid", 10)

  rm.AddIngredient("se-belt-probe", "transceiver", 100)
  rm.AddIngredient("se-star-probe", "transceiver", 100)
  rm.AddIngredient("se-void-probe", "transceiver", 100)
  rm.AddIngredient("se-arcosphere-collector", "transceiver", 250)

  rm.ReplaceProportional("se-supercharger", "battery", "hv-power-regulator", 1/2)

  rm.AddIngredient("se-space-thermodynamics-laboratory", "advanced-cable", 50)

  cu.moveItem("potassium-nitrate", "stone", "z")
end
