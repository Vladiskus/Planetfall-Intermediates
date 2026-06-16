local parts = require("variable-parts")
local tf = require("techfuncs")
local rm = require("recipe-modify")

local yield = 1
local cost = 1

if mods["Krastorio2"] then
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
    name = "invar-valve",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 3,
    ingredients = tf.compilePrereqs{{type="item", name="steel-plate", amount=1}, {type="item", name="pipe", amount=2}, parts.preferred({"airtight-seal", "copper-plate"}, {1, 2})},
    results = {{type="item", name="invar-valve", amount=1}},
  }
})

for k, v in pairs(data.raw["technology"]) do
  tf.removeRecipeUnlock(v.name, "iron-stick")
end
data.raw.recipe["iron-stick"].enabled = true

if parts.nickelExperimental then
  data:extend({
    {
      type = "recipe",
      name = "motorized-articulator",
      category = "crafting",
      energy_required = 2,
      enabled = false,
      ingredients = tf.compilePrereqs{parts.preferred({"electric-motor", "motor"}, {2, 2}), {type="item", name="electronic-circuit", amount=1}, parts.preferred({"articulated-mechanism", "kr-inserter-parts", "iron-gear-wheel"},
        {2, 1, 2}), parts.optionalIngredient("bronze-plate", 2)},
      results = {{type="item", name="motorized-articulator", amount=1}},
    },
    {
      type = "recipe",
      name = "cooling-fan",
      category = "advanced-crafting",
      energy_required = 2,
      enabled = false,
      ingredients = {parts.preferred({"electric-motor", "motor"}, {1, 1}), {type="item", name="plastic-bar", amount=4}},
      results = {{type="item", name="cooling-fan", amount=1}},
    },
    {
      type = "recipe",
      name = "gimbaled-thruster",
      category = "crafting",
      energy_required = 30,
      enabled = false,
      ingredients = tf.compilePrereqs{{type="item", name="motorized-articulator", amount=1}, {type="item", name="invar-valve", amount=1}, parts.preferred({"rocket-engine-nozzle", "se-heat-shielding", "steel-plate"}, {2, 1, 2}), 
        parts.preferred({"complex-joint", "bearing", "iron-gear-wheel"}, {1, 2, 4})},
      results = {{type="item", name="gimbaled-thruster", amount=1}},
    },
    {
      type = "recipe",
      name = "flow-controller",
      category = "crafting",
      energy_required = 2,
      enabled = false,
      ingredients = tf.compilePrereqs{parts.preferred({"electric-motor", "motor"}, {1, 1}), {type="item", name="invar-valve", amount=1}, {type="item", name="electronic-circuit", amount=1}, 
        parts.preferred({"tinned-cable", mods["Krastorio2"] and "kr-glass" or "glass"}, {2, 1})},
      results = {{type="item", name="flow-controller", amount=1}},
    }
  })

  if mods["LunarLandings"] then
    data:extend({
      {
        type = "recipe",
        name = "pack-gimbaled-thruster",
        category = "crafting",
        energy_required = 2,
        enabled = false,
        icon = "__Planetfall_Intermediates__/graphics/icons/gimbaled-thruster-packed.png",
        icon_size = 64,
        subgroup = "ll-packed-rocket-ingredients",
        localised_name = {"recipe-name.pack-gimbaled-thruster"},
        order = "za",
        ingredients = {{type="item", name="gimbaled-thruster", amount=5}},
        results = {{type="item", name="gimbaled-thruster-packed", amount=1}}
      },
      {
        type = "recipe",
        name = "unpack-gimbaled-thruster",
        category = "crafting",
        energy_required = 2,
        enabled = false,
        icon = "__Planetfall_Intermediates__/graphics/icons/gimbaled-thruster-packed.png",
        icon_size = 64,
        subgroup = "ll-packed-rocket-ingredients",
        localised_name = {"recipe-name.unpack-gimbaled-thruster"},
        order = "zb",
        ingredients = {{type="item", name="gimbaled-thruster-packed", amount=1}},
        results = {{type="item", name="gimbaled-thruster", amount=5}}
      }
    })
  end

  if not mods["galdocs-manufacturing"] then
    data:extend({
      {
        type = "recipe",
        name = "machining-tool",
        category = "crafting",
        energy_required = 2,
        enabled = false,
        ingredients = tf.compilePrereqs{parts.preferred({"electric-motor", "motor"}, {1, 1}), {type="item", name="motorized-articulator", amount=1}, parts.preferred({"tungsten-carbide", "steel-plate"}, {2, 1})},
        results = {{type="item", name="machining-tool", amount=1}},
      },
      {
        type = "recipe",
        name = "advanced-machining-tool",
        category = "crafting",
        energy_required = 4,
        enabled = false,
        ingredients = tf.compilePrereqs{{type="item", name="machining-tool", amount=1}, parts.optionalIngredient("diamond", 1), parts.preferred({"complex-joint", "bearing", "iron-gear-wheel"}, {1, 2, 4}), {type="item", name="speed-module", amount=1}},
        results = {{type="item", name="advanced-machining-tool", amount=1}},
      }
    })
  end

  if mods["space-exploration"] then
    data:extend({
      {
        type = "recipe",
        name = "nickel-electromagnet",
        category = "crafting",
        energy_required = 2,
        enabled = false,
        ingredients = {{type="item", name="electronic-circuit", amount=1}, {type="item", name="iron-stick", amount=4}, {type="item", name="copper-cable", amount=4}},
        results = {{type="item", name="nickel-electromagnet",amount=4}}
      },
      {
        type = "recipe",
        name = "advanced-flow-controller",
        category = "crafting",
        energy_required = 8,
        enabled = false,
        allow_decomposition = false,
        ingredients = tf.compilePrereqs{{type="item", name="flow-controller", amount=2}, {type="item", name="invar-valve", amount=2}, {type="item", name="advanced-circuit", amount=1}, parts.preferred({"kr-steel-pipe", "pipe"}, {4, 10})},
        results = {{type="item", name="advanced-flow-controller", amount=1}},
      },
      {
        type = "recipe",
        name = "flow-controller-biological",
        category = "advanced-crafting",
        icons = {
          {
            icon = "__Planetfall_Intermediates__/graphics/icons/flow-controller.png",
            icon_size = 64
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/vitamelange-bloom.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        energy_required = 9,
        enabled = false,
        allow_decomposition = false,
        ingredients = tf.compilePrereqs{{type="item", name="electric-motor", amount=1}, {type="item", name="invar-valve", amount=3}, {type="item", name="electronic-circuit", amount=1}, {type="item", name="se-vitamelange-bloom", amount=2},
          parts.preferred({"tinned-cable", mods["Krastorio2"] and "kr-glass" or "glass"}, {3, 3})},
        results = {{type="item", name="flow-controller", amount=3}},
        main_product = "flow-controller"
      },
      {
        type = "recipe",
        name = "advanced-flow-controller-biological",
        category = "advanced-crafting",
        icons = {
          {
            icon = "__Planetfall_Intermediates__/graphics/icons/advanced-flow-controller.png",
            icon_size = 64
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/vitamelange-bloom.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          },
         },
        energy_required = 30,
        enabled = false,
        ingredients = tf.compilePrereqs{{type="item", name="flow-controller", amount=6}, parts.preferred({"self-regulating-valve", "invar-valve"}, {2, 2}), {type="item", name="advanced-circuit", amount=1}, 
          parts.preferred({"kr-steel-pipe", "pipe"}, {12, 30}), {type="item", name="se-vitamelange-bloom", amount=5}},
        results = {{type="item", name="advanced-flow-controller", amount=3}},
        main_product = "advanced-flow-controller"
      }
    })
  end
end

if parts.nitinol then
  data:extend({
    {
      type = "recipe",
      name = "self-regulating-valve",
      category = "advanced-crafting",
      energy_required = 8,
      ingredients = tf.compilePrereqs{{type="item", name="nitinol-plate", amount=1}, {type="item", name="invar-valve", amount=1}, parts.preferred({"titanium-palladium-flange", "titanium-plate"}, {2, 2})},
      results = {{type="item", name="self-regulating-valve", amount=2}},
      enabled = false,
    },
    {
      type = "recipe",
      name = "nitinol-mesh",
      category = "advanced-crafting",
      energy_required = 8,
      ingredients = tf.compilePrereqs{{type="item", name="nitinol-plate", amount=3}, parts.preferred({"aluminum-2219", "iron-stick"}, {2, 4}), parts.preferred({"carbon-fiber", "plastic-bar"}, {2, 2})},
      results = {{type="item", name="nitinol-mesh", amount=2}},
      enabled = false,
      lasermill = {
        convert = true,
        helium = 3,
        se_variant = "space-crafting",
        unlock = "se-space-assembling",
        se_tooltip_entity = "se-space-assembling-machine",
        icon_offset = {8, -8}
      }
    },
    {
      type = "recipe",
      name = "nitinol-mesh-beryllium",
      category = "advanced-crafting",
      icons = {
        {
          icon = "__Planetfall_Intermediates__/graphics/icons/nitinol-mesh.png",
          icon_size = 64
        },
        {
          icon = "__space-exploration-graphics__/graphics/icons/beryllium-plate.png",
          icon_size = 64,
          scale = 0.25,
          shift = {-8, -8}
        }
      },
      energy_required = 24,
      ingredients = tf.compilePrereqs{{type="item", name="nitinol-plate", amount=6}, {type="item", name="se-beryllium-plate", amount=1}, parts.preferred({"carbon-fiber", "plastic-bar"}, {4, 4})},
      results = {{type="item", name="nitinol-mesh", amount=6}},
      enabled = false,
      lasermill = {
        convert = true,
        helium = 9,
        se_variant = "space-crafting",
        unlock = "nitinol-mesh-beryllium",
        se_tooltip_entity = "se-space-assembling-machine",
        icon_offset = {8, -8}
      }
    }
  })
end
