local parts = {}

parts.aai = mods["aai-industry"]
parts.k2 = mods["Krastorio2"] or mods["Krastorio2-spaced-out"]

parts.bz = {}
parts.bz.carbon = mods["bzcarbon"] or mods["bzcarbon2"]
parts.bz.lead = mods["bzlead"] or mods["bzlead2"]
parts.bz.silicon = mods["bzsilicon"] or mods["bzsilicon2"]
parts.bz.tin = mods["bztin"] or mods["bztin2"]
parts.bz.titanium = mods["bztitanium"] or mods["bztitanium2"]
parts.bz.zirconium = mods["bzzirocnium"] or mods["bzzirocnium2"]
parts.bz.gold = mods["bzgold"] or mods["bzgold2"]
parts.bz.aluminum = mods["bzaluminum"] or mods["bzaluminum2"]
parts.bz.gas = mods["bzgas"] or mods["bzgas2"]
parts.bz.chlorine = mods["bzchlorine"] or mods["bzchlorine2"]
parts.bz.tungsten = mods["bztungsten"] or mods["bztungsten2"]

parts.nickelExternal = mods["IfNickel-Updated"] or mods["IfNickelMk2"]
parts.nickel = true or parts.nickelExternal
parts.nickelExperimental = parts.nickel
parts.motor = "electric-motor"
parts.steelValve = false
parts.nitinol = false

parts.brassExternal = mods["BrassTacks-Updated"] or mods["BrassTacksMk2"]
parts.brass = true or parts.brassExternal
parts.brassExperimental = parts.brass
parts.gyroscope = "gyro"

if data.raw.item["diamond"] and (mods["aai-industry"] or mods["big-mining-drill"] or parts.k2 or mods["vtk-deep-core-mining"] or mods["248k-Redux"]) then
  parts.drill = true
else
  parts.drill = false
end

parts.goldExternal = mods["ThemTharHills-Updated"] or mods["ThemTharHillsMk2"]
parts.gold = true or parts.goldExternal
parts.heavyGyro = true
parts.aquaregia = false

parts.sulfurExternal = mods["BrimStuff-Updated"] or mods["BrimStuffMk2"]
parts.sulfur = true or parts.sulfurExternal
parts.green = not parts.k2
parts.waste = false
parts.oil_tol = false
parts.coke_tol = false

if mods["ThemTharHills-Updated"] then
  parts.acidwaste = "depleted-acid"
else
  parts.acidwaste = "chemical-waste"
end

parts.laserExternal = mods["LasingAround-Updated"] or mods["LasingAroundMk2"]
parts.laser = true or parts.laserExternal

function parts.preferred(ingredients, quantities)
  for k, v in ipairs(ingredients) do
    if data.raw.item[v] then
      return {type="item", name=v, amount=quantities[k]}
    end
  end
end

function parts.optionalIngredient(item, amount)
  if data.raw.item[item] then
    return {type="item", name=item, amount=amount}
  end
end

function parts.qualityIconPath(mod, icon)
  local prefix = ""
  if mod == "brasstacks" then
    prefix = "__Planetfall_Intermediates__/graphics/galdoc/"
  end
  if prefix ~= "" then
    return prefix .. icon
  end
end

if (mods["bzfoundry"] or mods["bzfoundry2"]) and not settings.startup["bzfoundry-minimal"].value then
  parts.foundryEnabled = true
else
  parts.foundryEnabled = false
end

return parts