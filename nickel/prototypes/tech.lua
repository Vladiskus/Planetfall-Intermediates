local tf = require("techfuncs")
local parts = require("variable-parts")

data:extend({
  {
    type = "technology",
    name = "valves",
    icon = "__Planetfall_Intermediates__/graphics/tech/valves.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "invar-valve"
      },
      parts.nickelExperimental and {
        type = "unlock-recipe",
        recipe = "flow-controller"
      } or nil
    },
    prerequisites = tf.compilePrereqs{not (mods["Krastorio2"] or mods["MoreScience"]) and "logistic-science-pack" or nil, parts.nickelExperimental and "electronics" or nil, "steel-processing"},
    unit =
    {
      count = 50,
      ingredients =
      tf.compilePrereqs{
        {"automation-science-pack", 1},
        not (mods["Krastorio2"] or mods["MoreScience"]) and {"logistic-science-pack", 1} or nil
      },
      time = (mods["Krastorio2"] or mods["MoreScience"]) and 15 or 30
    },
    order = "b"
  }
})

if parts.nickelExperimental then
  data:extend({
    {
      type = "technology",
      name = "injection-molding",
      icon = "__Planetfall_Intermediates__/graphics/tech/injection-molding.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "cooling-fan"
        }
      },
      prerequisites = {"chemical-science-pack"},
      unit =
      {
        count = 100,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1}
        },
        time = 30
      },
      order = "b"
    },
    {
      type = "technology",
      name = "gimbaled-thruster",
      icon = "__Planetfall_Intermediates__/graphics/tech/gimbaled-thruster.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "gimbaled-thruster"
        }
      },
      prerequisites = tf.compilePrereqs{(not (mods["space-exploration"] or mods["LunarLandings"])) and "utility-science-pack" or nil, "rocket-fuel"},
      unit =
      {
        count = 150,
        ingredients =
        tf.compilePrereqs{
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          (not (mods["space-age"] or mods["space-exploration"] or mods["LunarLandings"])) and {"utility-science-pack", 1} or nil
        },
        time = 30
      },
      order = "b"
    }
  })
  if not parts.brassExperimental then
    data:extend({
      {
        type = "technology",
        name = "mechanical-engineering",
        icon = "__Planetfall_Intermediates__/graphics/tech/mechanical-engineering.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "motorized-articulator"
          }
        },
        prerequisites = {"logistic-science-pack"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
          },
          time = 30
        },
        order = "e"
      }
    })
  end
  if mods["space-exploration"] then
    data:extend({
      {
        type = "technology",
        name = "machine-homeostasis",
        icons = {
          {
            icon = "__Planetfall_Intermediates__/graphics/tech/advanced-flow-controller.png",
            icon_size = 256
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/vitamelange-bloom.png",
            icon_size = 64,
            scale = 1,
            shift = {-64, -64}
          },
         },
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "flow-controller-biological"
          },
          {
            type = "unlock-recipe",
            recipe = "advanced-flow-controller-biological"
          }
        },
        prerequisites = {"se-biological-science-pack-1"},
        unit =
        {
          count = 100,
          ingredients =
          {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 },
            { "se-biological-science-pack-1", 1 },
          },
          time = 30
        },
        order = "e"
      },
      {
        type = "technology",
        name = "advanced-flow-controller",
        icon = "__Planetfall_Intermediates__/graphics/tech/advanced-flow-controller.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "advanced-flow-controller"
          }
        },
        prerequisites = {"chemical-science-pack"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        order = "e"
      },
      {
        type = "technology",
        name = "nickel-electromagnet",
        icon = "__Planetfall_Intermediates__/graphics/tech/nickel-electromagnet.png",
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "nickel-electromagnet"
          }
        },
        prerequisites = {"chemical-science-pack"},
        unit =
        {
          count = 75,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 30
        },
        order = "e"
      }
    })
  end
end