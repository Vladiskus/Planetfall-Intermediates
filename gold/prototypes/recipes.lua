local parts = require("variable-parts")
local rm = require("recipe-modify")
local tf = require("techfuncs")

for k, v in pairs(data.raw["technology"]) do
  tf.removeRecipeUnlock(v.name, "iron-stick")
end
data.raw.recipe["iron-stick"].enabled = true
data:extend({
  {
    type = "recipe",
    name = "transceiver",
    category = "crafting",
    enabled = false,
    energy_required = 2,
    ingredients = tf.compilePrereqs{{type="item", name="electronic-circuit", amount=3}, {type="item", name="copper-cable", amount=5}, 
      parts.preferred({"kr-quartz", "silica", "iron-stick"}, {1, 1, 1}), parts.preferred({"pcb-solder", "solder"}, {1, 1})},
    results = {{type="item", name="transceiver", amount=1}},
  },
  {
    type = "recipe",
    name = "advanced-cable",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 3,
    ingredients = tf.compilePrereqs{{type="item", name="copper-cable", amount=6}, {type="item", name="plastic-bar", amount=3}, parts.optionalIngredient("silver-wire", 2), parts.optionalIngredient("tinned-cable", 1)},
    results = {{type="item", name="advanced-cable", amount=1}},
  },
  {
    type = "recipe",
    name = "hv-power-regulator",
    category = "crafting",
    enabled = false,
    energy_required = 6,
    ingredients = tf.compilePrereqs{{type="item", name="advanced-circuit", amount=5}, {type="item", name="advanced-cable", amount=2}, {type="item", name="battery", amount=2}, 
      parts.preferred({"cooling-fan", "aluminum-plate", "galvanized-steel-plate", "steel-plate"}, {1, 5, 1, 1}), parts.optionalIngredient("el_energy_crystal", 1), parts.optionalIngredient("acsr-cable", 1)},
    results = {{type="item", name="hv-power-regulator", amount=1}},
  },
  {
    type = "recipe",
    name = "integrated-circuit",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 1,
    ingredients = tf.compilePrereqs{{type="item", name="plastic-bar", amount=1}, {type="item", name="copper-plate", amount=2}, parts.preferred({"ll-silicon", "silicon-wafer", mods["Krastorio2"] and "kr-silicon" or "silicon", "copper-cable"}, {2, 1, 2, 2})},
    results = {{type="item", name="integrated-circuit",amount=2}},
  }
}
)

if parts.aquaregia then
  data:extend({
    {
      type = "recipe",
      name = "aqua-regia",
      category = "chemistry",
      enabled = false,
      energy_required = 1,
      subgroup = "fluid-recipes",
      order = "y04a", --this is where it belongs with se. otherwise it will be moved later.
      ingredients = tf.compilePrereqs{data.raw["fluid"]["hydrogen-chloride"] and {type="fluid", name="hydrogen-chloride", amount=100} or nil,
      data.raw["fluid"]["kr-hydrogen-chloride"] and {type="fluid", name="kr-hydrogen-chloride", amount=100} or nil,
        {type="fluid", name=mods["Krastorio2"] and "kr-nitric-acid" or "nitric-acid", amount=mods["Krastorio2"] and 100 or 160}},
      results = {{type="fluid", name="aqua-regia", amount=200}},
      emissions_multiplier = 0.25,
      crafting_machine_tint = {
        primary = {0.75, 0.75, 1, 1},
        secondary = {0.75, 1, 0.75, 1},
        tertiary = {1, 0.2, 0, 0.3},
        quaternary = {1, 1, 1, 0.6}
      }
    }
  })
end

if parts.bz.gold and data.raw.item["silver-plate"] and rm.CheckIngredient("integrated-circuit", "copper-plate") then
  data:extend({
    {
      type = "recipe",
      name = "integrated-circuit-silver",
      icons = {
        {
          icon = "__Planetfall_Intermediates__/graphics/icons/integrated-circuit.png",
          icon_size = 64
        },
        {
          icon = "__bzgold" .. (mods["bzgold2"] and "2" or "") .. "__/graphics/icons/silver-plate.png",
          icon_size = 128,
          scale = 0.125,
          shift = {8, -8}
        }
      },
      category = "advanced-crafting",
      enabled = false,
      energy_required = 1,
      ingredients = tf.compilePrereqs{{type="item", name="plastic-bar", amount=1}, {type="item", name="silver-plate", amount=2}, parts.preferred({"ll-silicon", "silicon-wafer", mods["Krastorio2"] and "kr-silicon" or "silicon", "copper-cable"}, {2, 1, 2, 2})},
      results = {{type="item", name="integrated-circuit",amount=2}},
    }
  })
  data.raw.recipe["integrated-circuit"].icons = {
    {
      icon = "__Planetfall_Intermediates__/graphics/icons/integrated-circuit.png",
      icon_size = 64
    },
    {
      icon = "__base__/graphics/icons/copper-plate.png",
      icon_size = 64,
      scale = 0.25,
      shift = {8, -8}
    }
  }
end

if mods["Krastorio2"] then
  data:extend({
    {
      type = "recipe",
      name = "ammonia-from-potassium-nitrate",
      icons = {
        {
          icon = "__Krastorio2Assets__/icons/fluids/ammonia.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__Planetfall_Intermediates__/graphics/icons/potassium-nitrate.png",
          icon_size = 64,
          shift = {-8, -8},
          scale = 0.25
        }
      },
      category = "chemistry",
      subgroup = "fluid-recipes",
      order = "y03[ammonia]alt",
      enabled = false,
      energy_required = 2,
      ingredients = {{type="fluid", name="water", amount=20}, {type="item", name="potassium-nitrate", amount=1}},
      results = {{type="fluid", name="kr-ammonia", amount=20}},
      crafting_machine_tint = {
        primary = {0.5, 0.5, 1, 1},
        secondary = {1, 1, 1, 1},
        tertiary = {0.5, 0.5, 1, 1},
        quaternary = {0.8, 0.8, 0.8, 1}
      }
    }
  })
  
  local matterutil = require("__Krastorio2__/prototypes/libraries/matter")
  data:extend(
    {
      {
        type = "recipe",
        name = "nitric-acid-early",
        icons = {
          {
            icon = "__Krastorio2Assets__/icons/fluids/nitric-acid.png",
            icon_size = 64,
            icon_mipmaps = 4,
          },
          {
            icon = "__Planetfall_Intermediates__/graphics/icons/potassium-nitrate.png",
            icon_size = 64,
            scale = 0.25,
            shift = {-8, -8}
          }
        },
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "y04[nitric-acid]alt",
        enabled = false,
        energy_required = 3,
        ingredients = {{type="item", name="potassium-nitrate", amount=1}, {type="fluid", name="water", amount=30}},
        results = {{type="fluid", name=mods["Krastorio2"] and "kr-nitric-acid" or "nitric-acid", amount=5}},
        crafting_machine_tint = {
          primary = {0.75, 0.75, 1, 1},
          secondary = {1, 1, 1, 1},
          tertiary = {0.5, 0.5, 1, 1},
          quaternary = {1, 1, 1, 1}
        }
      }
    }
  )
else
  data:extend({
    {
      type = "recipe",
      name = "nitric-acid",
      category = "chemistry",
      enabled = false,
      energy_required = 1,
      subgroup = "fluid-recipes",
      order = "y04", --this is where it belongs with se. otherwise it will be moved later.
      ingredients = tf.compilePrereqs{{type="item", name="copper-plate", amount=1}, {type="fluid", name="water", amount=100}, {type="fluid", name="sulfuric-acid", amount=10}, parts.optionalIngredient("potassium-nitrate", 1)},
      results = {{type="fluid", name="nitric-acid", amount=100}},
      crafting_machine_tint = {
        primary = {0.5, 0.75, 1, 1},
        secondary = {1, 1, 1, 1},
        tertiary = {0.25, 0.5, 1, 1},
        quaternary = {1, 1, 1, 1}
      }
    }
  })
end

if mods["space-exploration"] then
  if mods["Krastorio2"] then
    se_delivery_cannon_recipes["potassium-nitrate"] = {name= "potassium-nitrate"}
  else
    se_delivery_cannon_recipes["nitric-acid-barrel"] = {name= "nitric-acid-barrel"}
  end
end

if mods["LunarLandings"] then
  data:extend({
    {
      type = "recipe",
      name = "entangled-transceiver",
      category = "ll-quantum-resonating",
      localised_name = { "recipe-name.entangled-transceiver" },
      icons = {
        {
          icon = "__Planetfall_Intermediates__/graphics/icons/transceiver.png",
          icon_size = 64
        },
        {
          icon = "__LunarLandings__/graphics/icons/polariton/polariton.png",
          icon_size = 64,
          scale = 0.25,
          shift = {-8, -8}
        }
      },
      energy_required = 15,
      allow_decomposition = false,
      ingredients = {{type="item", name="integrated-circuit", amount=30}, {type="item", name="ll-down-polariton", amount=1}, {type="item", name="ll-right-polariton", amount=1}},
      results = {{type="item", name="transceiver", amount=30}, {type="item", name="ll-up-polariton", amount=2}},
      main_product = "transceiver",
      enabled = false
    }
  })
end
