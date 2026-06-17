local parts = require("variable-parts")

local stacksize_override = nil

data:extend({
  {
    type = "item",
    name = "transceiver",
    icon = "__Planetfall_Intermediates__/graphics/icons/transceiver.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "gb",
    stack_size = 100
  },
  {
    type = "item",
    name = "advanced-cable",
    icon = "__Planetfall_Intermediates__/graphics/icons/advanced-cable.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "z",
    stack_size = 100
  },
  {
    type = "item",
    name = "hv-power-regulator",
    icon = "__Planetfall_Intermediates__/graphics/icons/hv-power-regulator.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "gcb",
    stack_size = 50
  },
  {
    type = "item",
    name = "integrated-circuit",
    icon = "__Planetfall_Intermediates__/graphics/icons/integrated-circuit.png",
    icon_size = 64,
    subgroup = "generic-circuits",
    order = "z",
    stack_size = 100
  },
  {
    type = "item-subgroup",
    name = "advanced-chemicals", --by which i mean 'not oil fractions'
    group = "intermediate-products",
    order = "ab"
  },
  {
    type = "item-subgroup",
    name = "cable",
    group = "intermediate-products",
    order = mods["space-exploration"] and "a-am" or "f-z"
  },
  {
    type = "item-subgroup",
    name = "fiddly-electrical-gubbins",
    group = "intermediate-products",
    order = "f-za"
  },
  {
    type = "item-subgroup",
    name = "generic-circuits",
    group = "intermediate-products",
    order = "f-zb"
  },
  {
    type = "item-subgroup",
    name = "specialized-electronics",
    group = "intermediate-products",
    order = "f-zc"
  }
})

if parts.k2 then
  data:extend({
  {
    type = "item",
    name = "potassium-nitrate",
    icon = "__Planetfall_Intermediates__/graphics/icons/potassium-nitrate.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "ga",
    stack_size = stacksize_override or 100
  }
  })
else
  data:extend({
  {
    type = "fluid",
    name = "nitric-acid",
    icon = "__Planetfall_Intermediates__/graphics/icons/nitric-acid.png",
    icon_size = 64,
    subgroup = "fluid",
    order = "g",
    default_temperature = 25,
    max_temperature = 25,
    base_color = {r=0.75, g=0.75, b=1, a=1},
    flow_color = {r=1, g=1, b=1, a=1},
    auto_barrel = true
  }
  })
end

if parts.aquaregia then
  data:extend({
  {
    type = "fluid",
    name = "aqua-regia",
    icon = "__Planetfall_Intermediates__/graphics/icons/aqua-regia.png",
    icon_size = 64,
    subgroup = "fluid",
    order = "ga",
    default_temperature = 25,
    max_temperature = 25,
    base_color = {r=1, g=0.2, b=0, a=1},
    flow_color = {r=1, g=1, b=1, a=1},
    auto_barrel = true
  }
  })
end