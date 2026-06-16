local rm = require("recipe-modify")
local tf = require("techfuncs")
local parts = require("variable-parts")
local cu = require("category-utils")

local advfitting = "bolted-flange"
if parts.bz.carbon or mods["BrimStuff-Updated"] then
  advfitting = "airtight-seal"
end

if mods["aai-containers"] then
  rm.AddIngredient("aai-strongbox-passive-provider", "iron-gear-wheel", 2)
  if parts.brassExperimental then
    rm.AddIngredient("aai-strongbox", "articulated-mechanism", 5)
    rm.AddIngredient("aai-storehouse", "articulated-mechanism", 10)
    rm.AddIngredient("aai-warehouse", "articulated-mechanism", 20)
    rm.AddIngredient("aai-warehouse-passive-provider", "complex-joint", 5)
    tf.addPrereq("aai-warehouse-storage", "mechanical-engineering-2")
  else
    rm.AddIngredient("aai-storehouse-passive-provider", "iron-gear-wheel", 5)
    rm.AddIngredient("aai-warehouse-passive-provider", "iron-gear-wheel", 10)
  end
end

if mods["aai-signal-transmission"] then
  if parts.brassExperimental then
    tf.addPrereq("aai-signal-transmission", "skyseeker-armature")

    rm.AddIngredient("aai-signal-sender", "skyseeker-armature", 5)
    rm.RemoveIngredient("aai-signal-sender", "electric-engine-unit", 10)
    rm.AddIngredient("aai-signal-receiver", "skyseeker-armature", 5)
    rm.RemoveIngredient("aai-signal-receiver", "electric-engine-unit", 10)
  end
end

if mods["aai-industry"] then
  if parts.brassExperimental then
    if parts.nickelExperimental then
      rm.RemoveIngredient("area-mining-drill", "steel-plate", 20)
    end
    rm.AddIngredient("area-mining-drill", "advanced-gearbox", 2)
    if parts.drill then
      rm.RemoveIngredient("area-mining-drill", "tungsten-carbide", 99999)
      rm.RemoveIngredient("area-mining-drill", "diamond", 99999)
      rm.RemoveIngredient("area-mining-drill", "electric-engine-unit", 4)
      rm.AddIngredient("area-mining-drill", "industrial-drill-head", 8)
    else
      rm.AddIngredient("area-mining-drill", "complex-joint", 10)
    end

    rm.RemoveIngredient("industrial-furnace", "steel-plate", 16)
    if mods["IfNickel-Updated"] then
      rm.AddIngredient("industrial-furnace", "hardened-hull", 8)
    else
      rm.AddIngredient("industrial-furnace", "hardened-hull", 12)
    end
  end
end

if mods["big-mining-drill"] then
  if parts.brassExperimental then
    if parts.nickelExperimental then
      rm.RemoveIngredient("big-mining-drill", "steel-plate", 20)
    end
    rm.AddIngredient("big-mining-drill", "advanced-gearbox", 2)
    if parts.drill then
      rm.RemoveIngredient("big-mining-drill", "tungsten-carbide", 99999)
      rm.RemoveIngredient("big-mining-drill", "diamond", 99999)
      rm.RemoveIngredient("big-mining-drill", "electric-engine-unit", 4)
      rm.AddIngredient("big-mining-drill", "industrial-drill-head", 8)
    else
      rm.AddIngredient("big-mining-drill", "complex-joint", 10)
    end
  end
end

if mods["jetpack"] and parts.brassExperimental then
  if parts.gyroscope then
    rm.RemoveIngredient("jetpack-2", parts.gyroscope, 99)
    rm.ReplaceIngredient("jetpack-2", "advanced-circuit", parts.gyroscope, 20)
    tf.addPrereq("jetpack-2", parts.gyroscope)
  end

  if not parts.nickelExperimental then
    rm.RemoveIngredient("jetpack-3", "complex-joint", 99)
    rm.AddIngredient("jetpack-3", "complex-joint", 30)
    tf.addPrereq("jetpack-3", "mechanical-engineering-2")
  end
end

if mods["space-exploration"] then

  if parts.brassExperimental then
    tf.addPrereq("se-meteor-defence", "skyseeker-armature")

    tf.addRecipeUnlock("se-heat-shielding-iridium", "hardened-hull-iridium")

    rm.AddIngredient("se-space-assembling-machine", "advanced-gearbox", 2)
    rm.ReplaceIngredient("se-space-assembling-machine", "cermet", "complex-joint", 5)

    rm.ReplaceIngredient("se-space-pipe", "steel-plate", "hardened-hull", 1)

    rm.ReplaceIngredient("se-rocket-launch-pad", "steel-plate", "hardened-hull", 500)
    rm.AddIngredient("se-rocket-launch-pad", "complex-joint", 100)

    rm.AddIngredient("se-pulveriser", "articulated-mechanism", 10)

    rm.AddIngredient("se-recycling-facility", "complex-joint", 5)
    rm.ReplaceIngredient("se-space-mechanical-laboratory", "cermet", "complex-joint", 40)
    rm.ReplaceIngredient("se-space-mechanical-laboratory", "steel-plate", "hardened-hull", 100)

    rm.AddIngredient("se-space-telescope", "skyseeker-armature", 5)
    rm.AddIngredient("se-space-telescope-gammaray", "skyseeker-armature", 25)
    rm.AddIngredient("se-space-telescope-radio", "skyseeker-armature", 25)
    rm.AddIngredient("se-space-telescope-microwave", "skyseeker-armature", 25)
    rm.AddIngredient("se-space-telescope-xray", "skyseeker-armature", 25)

    rm.AddIngredient("se-delivery-cannon-capsule", "hardened-hull", 1)
    rm.AddIngredient("se-delivery-cannon-capsule-iridium", "hardened-hull", 1)
    rm.AddIngredient("se-meteor-defence", "skyseeker-armature", 10)
    rm.ReplaceIngredient("se-delivery-cannon-weapon", "electric-engine-unit", "skyseeker-armature", 50)
    rm.ReplaceIngredient("se-delivery-cannon", "electric-engine-unit", "skyseeker-armature", 10)
    rm.RemoveIngredient("se-delivery-cannon", "gyro", 99)

    rm.AddIngredient("se-heavy-assembly", "complex-joint", 4)

    rm.ReplaceIngredient("se-core-miner-drill", "steel-plate", "hardened-hull", 50)

    rm.AddIngredient("se-spaceship-clamp", "complex-joint", 5)
    rm.AddIngredient("se-spaceship-gate", "complex-joint", 6)
    rm.ReplaceIngredient("se-spaceship-rocket-engine", "steel-plate", "hardened-hull", 20)
    rm.ReplaceIngredient("se-spaceship-rocket-booster-tank", "steel-plate", "hardened-hull", 10)

    rm.ReplaceIngredient("se-space-thermodynamics-laboratory", "steel-plate", "hardened-hull", 100)
    rm.ReplaceIngredient("se-space-radiation-laboratory", "steel-plate", "hardened-hull", 100)

    rm.ReplaceIngredient("se-space-transport-belt", "electric-motor", "gearbox", 2)
    rm.AddIngredient("se-space-splitter", "complex-joint", 1)
    rm.AddIngredient("se-space-splitter", "gearbox", 2)

    rm.RemoveIngredient("se-electric-boiler", "steel-plate", 10)
    if parts.nickel then
      rm.AddIngredient("se-electric-boiler", "hardened-hull", 5)
    else
      rm.AddIngredient("se-electric-boiler", "hardened-hull", 8)
    end

    if parts.gyroscope then
      rm.RemoveIngredient("se-space-gravimetrics-laboratory", parts.gyroscope, 8)
      rm.AddIngredient("se-space-gravimetrics-laboratory", parts.gyroscope, 50)

      rm.RemoveIngredient("se-space-mechanical-laboratory", parts.gyroscope, 99)
      rm.AddIngredient("se-space-mechanical-laboratory", parts.gyroscope, 10)

      rm.RemoveIngredient("se-thruster-suit-2", parts.gyroscope, 99)
      rm.AddIngredient("se-thruster-suit-2", parts.gyroscope, 10)

      rm.RemoveIngredient("se-spaceship-console", parts.gyroscope, 99)
      rm.AddIngredient("se-spaceship-console", parts.gyroscope, 10)
    end
  else
    rm.AddIngredient("se-pulveriser", "iron-gear-wheel", 10)
    rm.AddIngredient("se-space-assembling-machine", "bearing", 5)

    rm.AddIngredient("se-space-telescope", "bearing", 5)
    rm.AddIngredient("se-space-telescope-gammaray", "bearing", 25)
    rm.AddIngredient("se-space-telescope-radio", "bearing", 25)
    rm.AddIngredient("se-space-telescope-microwave", "bearing", 25)
    rm.AddIngredient("se-space-telescope-xray", "bearing", 25)

    rm.AddIngredient("se-recycling-facility", "bearing", 5)
    rm.AddIngredient("se-mechanical-laboratory", "bearing", 40)

    rm.AddIngredient("se-spaceship-clamp", "bearing", 5)
    rm.AddIngredient("se-spaceship-gate", "bearing", 6)

    rm.AddIngredient("se-space-transport-belt", "iron-gear-wheel", 5)
    rm.AddIngredient("se-space-splitter", "iron-gear-wheel", 10)
  end

  if not mods["IfNickel-Updated"] then
    rm.ReplaceIngredient("se-canister", "steel-plate", advfitting, 1)
  end
  rm.RemoveIngredient("se-canister", "graphite", 5)
  rm.AddIngredient("se-space-pipe", advfitting, 1)
  rm.AddIngredient("se-nutrient-vat", advfitting, 1)
  if advfitting == "airtight-seal" and parts.bz.gold then
    rm.RemoveIngredient("se-space-pipe", "silver-brazing-alloy", 99999)
  end
end

if mods["se-space-trains"] then
  if parts.brassExperimental then
    if parts.gyroscope then
        rm.RemoveIngredient("space-locomotive", parts.gyroscope, 99999)
        rm.AddIngredient("space-locomotive", parts.gyroscope, 10)
        rm.AddIngredient("space-cargo-wagon", parts.gyroscope, 1)
        rm.AddIngredient("space-fluid-wagon", parts.gyroscope, 1)
    end
    rm.ReplaceProportional("space-locomotive", "kr-steel-gear-wheel", "advanced-gearbox", 0.1)
    rm.ReplaceProportional("space-locomotive", "iron-gear-wheel", "advanced-gearbox", 0.1)
  end
end
