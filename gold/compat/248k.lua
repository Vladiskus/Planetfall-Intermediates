local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")

--[[
local function nukeItem(itemname)
  data.raw.item[itemname] = nil
  --delete 248k duplication recipe
  data.raw.recipe["gr_white_hole_cycle_"..itemname.."_recipe"] = nil
  --delete voiding recipes
  --if you make a dynamic voiding mod with expensive variants i will eat your eyeballs
  for recname, recipe in pairs(data.raw.recipe) do
    if recipe.results and #recipe.results == 0 then
      if rm.CheckIngredient(recname, itemname) then
        data.raw.recipe[recname] = nil
      end
    end
  end
end
]]--

if mods["248k-Redux"] then
  --fission era
  rm.RemoveIngredient("electric-engine-unit", "fi_gold", 99999)
  if not (mods["BrassTacks-Updated"] or mods["IfNickel-Updated"]) then
    rm.ReplaceProportional("fi_crusher", "engine-unit", "electric-engine-unit", 0.67)
    rm.ReplaceProportional("fi_fiberer", "engine-unit", "electric-engine-unit", 0.67)
    rm.ReplaceProportional("fi_compound_machine", "engine-unit", "electric-engine-unit", 0.67)
    tf.removePrereq("electric-engine", "fi_caster_tech")
    tf.addPrereq("fi_crusher_tech", "electric-engine")
  end

  rm.AddIngredient("fi_fiberer", "hv-power-regulator", 1)
  rm.AddIngredient("fi_compound_machine", "hv-power-regulator", 1)
  rm.AddIngredient("fi_crusher", "hv-power-regulator", 1)
  rm.AddIngredient("fi_refinery", "hv-power-regulator", 1)
  rm.AddIngredient("fi_robo_charger", "hv-power-regulator", 5)
  rm.AddIngredient("fi_ki_circuit", "hv-power-regulator", 1)
  rm.AddIngredient("fi_ki_beacon", "hv-power-regulator", 1)
  rm.AddIngredient("fi_ki_core", "hv-power-regulator", 10)

  --fusion era
  rm.AddIngredient("fu_activator", "hv-power-regulator", 10)
  rm.AddIngredient("fu_fusor", "hv-power-regulator", 10)
  rm.AddIngredient("fu_lab", "hv-power-regulator", 10)
  rm.AddIngredient("fu_magnet", "hv-power-regulator", 10)

  rm.AddIngredient("fu_tech_sign", "integrated-circuit", 1)
end
