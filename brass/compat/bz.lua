local rm = require("recipe-modify")
local tf = require("techfuncs")
local parts = require("variable-parts")

if parts.bz.tin then
  rm.AddIngredient("bolted-flange", "solder", 1)
end

if parts.bz.foundry and parts.brassExperimental then
  rm.ReplaceIngredient("electric-foundry", "steel-plate", "hardened-hull", 10)
end

if parts.bz.lead and parts.brassExperimental then
  if mods["FreightForwarding"] then
    rm.AddIngredient("hardened-hull", "lead-plate", 2)
  else
    rm.AddIngredient("hardened-hull", "lead-plate", 1)
  end
  rm.RemoveIngredient("electric-furnace", "lead-plate", 10)
  rm.RemoveIngredient("industrial-furnace", "lead-plate", 16)
  rm.RemoveIngredient("se-space-radiation-laboratory", "lead-plate", 100)
  --everyone and their cat has already complained about the BZ electric furnace
  --why is it there anyway lol. lead has a low melting point
end

if parts.bz.gold then
  if data.raw.item["silver-brazing-alloy"] then
    rm.multiply("airtight-seal", 2, true, true, true)
    rm.AddIngredient("airtight-seal", "silver-brazing-alloy", 2)
    rm.RemoveIngredient("airtight-seal", "bolted-flange", 1)
    rm.AddIngredient("airtight-seal-vitalic", "silver-brazing-alloy", 50)
    rm.RemoveIngredient("airtight-seal-vitalic", "bolted-flange", 50)
    if parts.nickel then
      tf.addPrereq("valves", "silver-processing")
    else if mods["BrimStuff-Updated"] then
      tf.addPrereq("rubber", "silver-processing")
    else
      tf.addPrereq(mods["aai-industry"] and "basic-fluid-handling" or "fluid-handling", "silver-processing")
    end end
  end
end

if parts.brassExperimental and parts.bz.tungsten and (not parts.nickel ) and (not mods["Krastorio2"]) then
  if data.raw.item["cuw"] then
    rm.ReplaceIngredient("hardened-hull", "iron-plate", "cuw", 2)
  else
    rm.ReplaceIngredient("hardened-hull", "iron-plate", "tungsten-plate", 2)
  end
  tf.addPrereq("hardened-hull", "tungsten-processing")
end

if mods["manganese"] then
  if parts.brassExperimental then
    tf.addPrereq("hardened-hull", "mangalloy")
    tf.removePrereq("mangalloy", "steel-processing")
    tf.addPrereq("hardened-hull", "mangalloy")
    tf.removePrereq("hardened-hull", "steel-processing")
    if mods["space-exploration"] then
      rm.ReplaceProportional("hardened-hull-iridium", "steel-plate", "mangalloy", 3)
    end
    if parts.drill then
      rm.AddIngredient("industrial-drill-head", "mangalloy", 2)
    end
  end
end
