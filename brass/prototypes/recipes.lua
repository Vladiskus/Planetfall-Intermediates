local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")

local yield = 1
local cost = 1

for k, v in pairs(data.raw["technology"]) do
  tf.removeRecipeUnlock(v.name, "iron-stick")
end
data.raw.recipe["iron-stick"].enabled = true

if parts.k2 then
  yield = 5
  cost = 10
  if mods["space-exploration"] then
    yield = 15
    cost = 20
  end
end

data:extend({
  {
    type = "recipe",
    name = "bolted-flange",
    category = "crafting",
    energy_required = 2.5,
    ingredients = {{type="item", name="iron-plate", amount=2}},
    results = {{type="item", name="bolted-flange", amount=1}},
    enabled = not parts.k2,
    lasermill = {helium=1, productivity=true}
  },
  {
    type = "recipe",
    name = "brass-balls",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 0.5,
    ingredients = {{type="item", name="steel-plate", amount=1}},
    results = {{type="item", name="brass-balls",amount=2}},
    lasermill = {helium=1, productivity=true, type="gubbins", multiply=2}
  },
  {
    type = "recipe",
    name = "bearing",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 4,
    ingredients = {{type="item", name="steel-plate", amount=2}, {type="item", name="brass-balls", amount=4}, {type="fluid", name="lubricant", amount=5}},
    results = {{type="item", name="bearing", amount=1}},
  }
})

if parts.bz.carbon or mods["BrimStuff-Updated"] then
  data:extend({
    {
      type = "recipe",
      name = "airtight-seal",
      category = "advanced-crafting",
      enabled = false,
      energy_required = 2.5,
      ingredients = {{type="item", name="bolted-flange", amount=1}, {type="item", name=parts.bz.carbon and "graphite" or "rubber", amount=2}},
      results = {{type="item", name="airtight-seal", amount=1}},
      lasermill = {helium=data.raw.item["silver-brazing-alloy"] and 4 or 2, productivity=true}
    }
  })
  if mods["space-exploration"] then
    data:extend({
      {
        type = "recipe",
        name = "airtight-seal-vitalic",
        category = "advanced-crafting",
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "icons/airtight-seal.png"),
            icon_size = 64
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/vitalic-epoxy.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        enabled = false,
        allow_decomposition = false,
        energy_required = 250,
        ingredients = {{type="item", name="bolted-flange", amount=150}, {type="item", name="graphite", amount=50}, {type="item", name="se-vitalic-epoxy", amount=1}},
        results = {{type="item", name="airtight-seal",amount=200}},
        always_show_products = true,
        localised_name = {"recipe-name.airtight-seal-vitalic"},
        lasermill = {helium=100, convert=true, se_variant="space-crafting", se_tooltip_entity="se-space-assembling-machine", unlock="airtight-seal-vitalic", icon_offset={8, -8}}
      }
    })
  end
end

if parts.brassExperimental then
  data:extend({
    {
      type = "recipe",
      name = "flywheel",
      category = "crafting",
      energy_required = 2,
      ingredients = {{type="item", name="iron-gear-wheel", amount=1}, {type="item", name="copper-plate", amount=4}},
      results = {{type="item", name="flywheel", amount=1}},
      lasermill = {helium = 2, productivity = true}
    },
    {
      type = "recipe",
      name = "articulated-mechanism",
      category = "crafting",
      energy_required = 1,
      ingredients = {{type="item", name="steel-plate", amount=data.raw.item["aluminum-plate"] and 1 or 2}, {type="item", name="iron-stick", amount=3}, parts.optionalIngredient("aluminum-plate", 1)},
      results = {{type="item", name="articulated-mechanism",amount=2}},
    },
    {
      type = "recipe",
      name = "hardened-hull",
      category = "crafting",
      energy_required = 2,
      ingredients = {{type="item", name="steel-plate", amount=1},  parts.preferred({"invar-plate", "iron-plate"}, {1, 2}), 
                     parts.preferred({"bronze-plate", "copper-plate"}, {2, 2})},
      results = {{type="item", name="hardened-hull", amount=1}},
      enabled = false,
      lasermill = {helium=5, productivity=true}
    },
    {
      type = "recipe",
      name = "complex-joint",
      category = "crafting-with-fluid",
      energy_required = 8,
      ingredients = {{type="item", name="bearing", amount=1}, {type="item", name="steel-plate", amount=1}, parts.preferred({"cermet", "zirconia", "plastic-bar"}, {1, 4, 2}), 
                     {type="item", name="articulated-mechanism", amount=8}, {type="fluid", name="lubricant", amount=5}},
      results = {{type="item", name="complex-joint", amount=1}},
      enabled = false,
    },
    {
      type = "recipe",
      name = "gearbox",
      category = "crafting",
      energy_required = 3,
      ingredients = {{type="item", name="steel-plate", amount=1}, {type="item", name="iron-gear-wheel", amount=(parts.k2 and 8 or 10)}},
      results = {{type="item", name="gearbox",amount=2}},
      enabled = false
    },
    {
      type = "recipe",
      name = "advanced-gearbox",
      category = "crafting-with-fluid",
      energy_required = 3,
      ingredients = {{type="item", name="gearbox", amount=1}, {type="item", name="iron-gear-wheel", amount=(parts.k2 and 4 or 5)}, 
                     {type="item", name="bearing", amount=2}, {type="item", name="flywheel", amount=1}, {type="fluid", name="lubricant", amount=20}},
      results = {{type="item", name="advanced-gearbox", amount=1}},
      enabled = false
    }
  })

  if parts.k2 then
    data:extend({
      {
        type = "recipe",
        name = "elite-gearbox",
        category = "advanced-crafting",
        energy_required = 6,
        ingredients = {{type="item", name="advanced-gearbox", amount=1}, {type="item", name="kr-imersium-gear-wheel", amount=4}, {type="item", name="kr-imersium-beam", amount=1}, 
                       parts.preferred({"se-heavy-bearing", "electric-engine-unit"}, {4, 1})},
        results = {{type="item", name="elite-gearbox", amount=1}},
        enabled = false
      }
    })
  end

  if mods["space-exploration"] then
    data:extend({
      {
        type = "recipe",
        name = "complex-joint-iridium",
        category = "crafting-with-fluid",
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "icons/complex-joint.png"),
            icon_size = 64
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/iridium-plate.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        localised_name = {"recipe-name.complex-joint-iridium"},
        energy_required = 64,
        ingredients = {{type="item", name="bearing", amount=8}, {type="item", name="se-iridium-plate", amount=1}, parts.preferred({"cermet", "zirconia", "plastic-bar"}, {8, 32, 16}), 
                       {type="item", name="articulated-mechanism", amount=48}, {type="fluid", name="lubricant", amount=40}},
        results = {{type="item", name="complex-joint",amount=8}},
        enabled = false,
        always_show_products = true,
      },
      {
        type = "recipe",
        name = "gearbox-iridium",
        category = "advanced-crafting",
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "icons/gearbox.png"),
            icon_size = 64
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/iridium-plate.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        energy_required = 48,
        ingredients = {{type="item", name="se-iridium-plate", amount=1}, {type="item", name="iron-gear-wheel", amount=(parts.k2 and 64 or 80)}, {type="item", name="electric-motor", amount=(parts.k2 and 12 or 16)}},
        results = {{type="item", name="gearbox",amount=16}},
        enabled = false,
        always_show_products = true,
        localised_name = {"recipe-name.gearbox-iridium"}
      },
      {
        type = "recipe",
        name = "hardened-hull-iridium",
        category = "advanced-crafting",
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "icons/hardened-hull.png"),
            icon_size = 64
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/iridium-plate.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        energy_required = 16,
        ingredients = {{type="item", name="se-iridium-plate", amount=1}, {type="item", name="steel-plate", amount=4}, parts.preferred({"invar-plate", "iron-plate"}, {4, 8}), 
          parts.preferred({"bronze-plate", "copper-plate"}, {16, 16}), parts.optionalIngredient("lead-plate", 8)},
        results = {{type="item", name="hardened-hull",amount=8}},
        enabled = false,
        always_show_products = true,
        localised_name = {"recipe-name.hardened-hull-iridium"},
        lasermill = {helium=30, convert=true, se_variant="space-crafting", se_tooltip_entity="se-space-assembling-machine", unlock="se-heat-shielding-iridium", icon_offset={8, -8}}
      }
    })
  end

  if parts.gyroscope then
    data:extend({
      {
        type = "recipe",
        name = parts.gyroscope,
        category = "crafting",
        energy_required = 5,
        --preferred can't be used - ifnickel loads after this.
        ingredients = {{type="item", name="flywheel", amount=1}, {type="item", name="bearing", amount=2}, {type="item", name="advanced-circuit", amount=1}, 
                       (mods["aai-industry"] and {type="item",name="electric-motor", amount=1}) or (parts.nickel and {type="item",name="motor", amount=1}) or (parts.k2 and {type="item",name="kr-steel-gear-wheel", amount=1}) or {type="item",name="iron-gear-wheel", amount=2}},
        results = {{type="item", name=parts.gyroscope, amount=1}},
        enabled = false
      }
    })
  end

  if mods["aai-signal-transmission"] or mods["LunarLandings"] then
    data:extend({
      {
        type = "recipe",
        name = "skyseeker-armature",
        category = "crafting",
        energy_required = 20,
        ingredients = {{type="item", name="complex-joint", amount=1}, {type="item", name="low-density-structure", amount=1}, {type="item", name="electric-engine-unit", amount=1}, 
                        parts.preferred({"kr-steel-gear-wheel", "iron-gear-wheel"}, {3, 6}), parts.preferred({"gyro", "gyroscope"}, {1, 1})},
        results = {{type="item", name="skyseeker-armature", amount=1}},
        enabled = false
      }
    })
  end

  if mods["LunarLandings"] and parts.nickel then
    data:extend({
      {
        type = "recipe",
        name = "hardened-hull-alumina",
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "icons/hardened-hull.png"),
            icon_size = 64
          },
          {
            icon = "__LunarLandings__/graphics/icons/alumina.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        category = "crafting",
        energy_required = 2,
        ingredients = {{type="item", name="steel-plate", amount=1}, {type="item", name="ll-alumina", amount=1}, parts.preferred({"bronze-plate", "copper-plate"}, {2, 2})},
        results = {{type="item", name="hardened-hull", amount=1}},
        enabled = false,
        lasermill = {helium=5, productivity=true, convert=true}
      }
    })
  end
end

if parts.drill then
  data:extend({
    {
      type = "recipe",
      name = "industrial-drill-head",
      category = "advanced-crafting",
      energy_required = 5,
      ingredients = {{type="item", name="complex-joint", amount=1}, {type="item", name="electric-engine-unit", amount=1}, parts.preferred({"tungsten-carbide", "steel-plate"}, {2, 4}), {type="item", name="diamond", amount=2}},
      results = {{type="item", name="industrial-drill-head", amount=1}},
      enabled = false
    },
  })
end


if mods["space-exploration"] then
  if parts.brassExperimental then
    se_delivery_cannon_recipes["hardened-hull"] = {name= "hardened-hull"}
  end
end