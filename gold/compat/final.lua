local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")
local cu = require("category-utils")

--this gets changed between so do it last instead of in the main krastorio part
if parts.k2 then
  if mods["aai-industry"] then
    rm.AddProductRaw("sand", {type="item", name="potassium-nitrate", amount=1, probability=0.05})
  end
  rm.AddProductRaw("kr-sand", {type="item", name="potassium-nitrate", amount=1, probability=0.15})
end

if mods["space-exploration"] then

  rm.ReplaceProportional("speed-module-3", "advanced-circuit", "integrated-circuit", 2)
  rm.ReplaceProportional("efficiency-module-3", "advanced-circuit", "integrated-circuit", 2)
  rm.ReplaceProportional("productivity-module-3", "advanced-circuit", "integrated-circuit", 2)

  if rm.CheckIngredient("se-processing-unit-holmium", parts.k2 and "kr-silicon" or "silicon") then
    rm.ReplaceIngredient("se-processing-unit-holmium", parts.k2 and "kr-silicon" or "silicon", "integrated-circuit", 5)
  else if rm.CheckIngredient("se-processing-unit-holmium", "silicon-wafer") then
    rm.ReplaceIngredient("se-processing-unit-holmium", "silicon-wafer", "integrated-circuit", 5)
  else
    rm.ReplaceIngredient("se-processing-unit-holmium", "electronic-circuit", "integrated-circuit", 5)
  end end
end

cu.moveItem("copper-cable", "cable", "a")
cu.moveItem("silver-wire", "cable", "b")
cu.moveRecipe("silver-wire", "cable", "b")
cu.moveItem("aluminum-cable", "cable", "c")
cu.moveItem("tinned-cable", "cable", "d")
cu.moveItem("optical-fiber", "cable", "e")
cu.moveItem("acsr-cable", "cable", "g")
cu.moveRecipe("acsr-cable", "cable", "g")
cu.moveItem("advanced-cable", "cable", "h")
cu.moveItem("se-holmium-cable", "cable", "i")
cu.moveItem("se-superconductive-cable", "cable", "j")

if mods["space-exploration"] then
  cu.moveGroup("generic-circuits", "intermediate-products", "a-c-z") -- electronic is a-c, processor is a-d.
  cu.moveGroup("fiddly-electrical-gubbins", "intermediate-products", "a-c-y")
  cu.moveGroup("specialized-electronics", "intermediate-products", "a-d-b")
  cu.moveItem("mainboard", "processor", "a")
  cu.moveRecipe("mainboard", "processor", "a")
  cu.moveRecipe("mainboard-holmium", "processor", "ab")
  cu.moveItem("kr-ai-core", "processor", "z-011")
else
  cu.moveItem("battery", "generic-circuits", "b")
  cu.moveItem("mainboard", "generic-circuits", "i")
  cu.moveRecipe("mainboard", "generic-circuits", "i")
  cu.moveItem("processing-unit", "generic-circuits", "j")
  if mods["LunarLandings"] then
    cu.moveItem("ll-quantum-processor", "generic-circuits", "k")
  end
end
cu.moveItem("solder", "generic-circuits", "a")
cu.moveItem("electronic-circuit", "generic-circuits", "c")
cu.moveItem("pcb-substrate", "generic-circuits", "d")
cu.moveItem("pcb", "generic-circuits", "e")
cu.moveItem("advanced-circuit", "generic-circuits", "f")
cu.moveItem("silicon-wafer", "generic-circuits", "g")
cu.moveItem("integrated-circuit", "generic-circuits", "h")

  --for some reason these have separate recipe and item orders despite being only craftable one way
  cu.moveRecipe("solder", "generic-circuits", "a")
  cu.moveRecipe("silicon-wafer", "generic-circuits", "g")

if parts.k2 or parts.bz.gold or parts.bz.chlorine then
  cu.moveItem("solder", "fiddly-electrical-gubbins", "a")
  cu.moveItem("pcb-solder", "fiddly-electrical-gubbins", "ab")
  cu.moveItem("battery", "fiddly-electrical-gubbins", "c")
  cu.moveItem("kr-electronic-components", "fiddly-electrical-gubbins", "d")
  cu.moveItem("silicon-wafer", "fiddly-electrical-gubbins", "e")
  cu.moveItem("temperature-sensor", "fiddly-electrical-gubbins", "f")
  cu.moveItem("mlcc", "fiddly-electrical-gubbins", "g")
  cu.moveItem("cpu", "fiddly-electrical-gubbins", "h")

  cu.moveRecipe("solder", "fiddly-electrical-gubbins", "a")
  cu.moveRecipe("pcb-solder", "fiddly-electrical-gubbins", "ab")
  cu.moveRecipe("battery", "fiddly-electrical-gubbins", "c")
  cu.moveRecipe("kr-electronic-components", "fiddly-electrical-gubbins", "d")
  cu.moveRecipe("silicon-wafer", "fiddly-electrical-gubbins", "e")
  cu.moveRecipe("temperature-sensor", "fiddly-electrical-gubbins", "f")
  cu.moveRecipe("mlcc", "fiddly-electrical-gubbins", "g")
  cu.moveRecipe("cpu", "fiddly-electrical-gubbins", "h")
  cu.moveRecipe("cpu-holmium", "fiddly-electrical-gubbins", "i")

  if not parts.nickel then
    cu.moveItem("spark-plug", "fiddly-electrical-gubbins", "b")
    cu.moveRecipe("spark-plug", "fiddly-electrical-gubbins", "b")
  end
end

cu.moveItem("solar-cell", "specialized-electronics", "a")
cu.moveItem("transceiver", "specialized-electronics", "b")
cu.moveItem("gyro", "specialized-electronics", "c")
cu.moveItem("gyroscope", "specialized-electronics", "c")
cu.moveItem("hv-power-regulator", "specialized-electronics", "d")
if not mods["space-exploration"] then
  cu.moveItem("flying-robot-frame", "specialized-electronics", "e")
  --cu.moveItem("rocket-control-unit", "specialized-electronics", "f")
end
cu.moveItem("kr-energy-control-unit", "specialized-electronics", "g")
cu.moveRecipe("solar-cell", "specialized-electronics", "a")

if not parts.k2 and not mods["space-exploration"] then
  cu.moveRecipe("sulfuric-acid", "advanced-chemicals", "a")
  cu.moveRecipe("nitric-acid", "advanced-chemicals", "b")
  cu.moveRecipe("nitric-acid-early", "advanced-chemicals", "b2")
  cu.moveRecipe("aqua-regia", "advanced-chemicals", "b3")
  cu.moveRecipe("hydrogen-chloride-pure", "advanced-chemicals", "c")
  cu.moveRecipe("hydrogen-chloride-salt", "advanced-chemicals", "d")
  cu.moveRecipe("vinyl-chloride", "advanced-chemicals", "e")
  cu.moveRecipe("chlorine", "advanced-chemicals", "f")
  cu.moveRecipe("epoxy", "advanced-chemicals", "g")
  cu.moveRecipe("organotins", "advanced-chemicals", "h")
end
