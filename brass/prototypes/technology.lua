local parts = require("variable-parts")
local techfuncs = require("techfuncs")

local red_science = mods["exotic-industries"] and "ei_dark-age-tech" or "automation-science-pack"
local green_science = mods["exotic-industries"] and "ei_steam-age-tech" or "logistic-science-pack"
local blue_science = mods["exotic-industries"] and "ei_electricity-age-tech" or "chemical-science-pack"

if (parts.bz.carbon or mods["BrimStuff-Updated"]) and mods["space-exploration"] then
  data:extend({
    {
      type = "technology",
      name = "airtight-seal-vitalic",
      icons = {
        {
          icon = parts.qualityIconPath("brasstacks", "icons/airtight-seal.png"),
          icon_size = 64
        },
        {
          icon = "__space-exploration-graphics__/graphics/icons/vitalic-epoxy.png",
          icon_size = 64,
          scale = 0.5,
          shift = {-16, -16}
        },
       },
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "airtight-seal-vitalic"
        }
      },
      prerequisites = {"se-vitalic-epoxy"},
      unit = {
        count = 50,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
          { "se-biological-science-pack-3", 1 },
        },
        time = 30,
      },
      order = "e"
    }
  })
end

if parts.brassExperimental then
  data:extend({
    {
      type = "technology",
      name = "hardened-hull",
      icon = parts.qualityIconPath("brasstacks", "technology/hardened-hull.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "hardened-hull"
        }
      },
      prerequisites = techfuncs.compilePrereqs{not (parts.k2 or mods["MoreScience"]) and "logistic-science-pack" or nil, "steel-processing", mods["galdocs-manufacturing"] and "gm-nickel-and-invar-machined-part-processing" or (parts.nickelExternal and "invar-processing" or nil), not parts.foundryEnabled and "automation" or nil},
      unit =
      {
        count = 50,
        ingredients =
        {
          {red_science, 1},
          not (parts.k2 or mods["MoreScience"]) and {green_science, 1} or nil
        },
        time = (parts.k2 or mods["MoreScience"]) and 15 or 30
      },
      order = "e"
    },
    {
      type = "technology",
      name = "mechanical-engineering",
      icon = parts.qualityIconPath("brasstacks", "technology/mechanical-engineering.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "gearbox"
        }
      },
      prerequisites = {"steel-processing", "logistic-science-pack"},
      unit =
      {
        count = 100,
        ingredients =
        {
          {red_science, 1},
          {green_science, 1}
        },
        time = 30
      },
      order = "e"
    },
    {
      type = "technology",
      name = "mechanical-engineering-2",
      icon = parts.qualityIconPath("brasstacks", "technology/mechanical-engineering-2.png"),
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "advanced-gearbox"
        },
        {
          type = "unlock-recipe",
          recipe = "complex-joint"
        },
        parts.drill and {
          type = "unlock-recipe",
          recipe = "industrial-drill-head"
        } or nil
      },
      prerequisites = techfuncs.compilePrereqs{"lubricant", "mechanical-engineering", data.raw.technology["cermet"] and "cermet" or nil},
      unit =
      {
        count = 100,
        ingredients =
        {
          {red_science, 1},
          {green_science, 1},
          {blue_science, 1}
        },
        time = 30
      },
      order = "e"
    }
  })

  if mods["space-exploration"] then
    data:extend({
      {
        type = "technology",
        name = "iridium-mechanisms",
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "technology/mechanical-engineering-2.png"),
            icon_size = 256
          },
          {
            icon = "__space-exploration-graphics__/graphics/icons/iridium-plate.png",
            icon_size = 64,
            scale = 2,
            shift = {-64, -64}
          },
         },
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "gearbox-iridium"
          },
          {
            type = "unlock-recipe",
            recipe = "complex-joint-iridium"
          }
        },
        prerequisites = {"se-heavy-bearing"},
        unit =
        {
          count = 50,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"se-material-science-pack-2", 1}
          },
          time = 30
        },
        order = "e"
      }
    })
  end

  if parts.gyroscope then
    data:extend({
      {
        type = "technology",
        name = parts.gyroscope,
        --tech may be named gyro or gyroscope.
        localised_name = {"technology-name.gyroscope"},
        localised_description = {"technology-description.gyroscope"},
        icons = {
          {
            icon = parts.qualityIconPath("brasstacks", "technology/gyroscope.png"),
            icon_size = 256,
          }
        },
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = parts.gyroscope
          }
        },
        prerequisites = {"lubricant"},
        unit =
        {
          count = 50,
          ingredients =
          {
            {red_science, 1},
            {green_science, 1},
            {blue_science, 1}
          },
          time = 30
        },
        order = "e"
      }
    })
  end

  if mods["aai-signal-transmission"] or mods["LunarLandings"] then
    data:extend({
      {
        type = "technology",
        name = "skyseeker-armature",
        icon = parts.qualityIconPath("brasstacks", "technology/skyseeker-armature.png"),
        icon_size = 256,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "skyseeker-armature"
          }
        },
        prerequisites = techfuncs.compilePrereqs{"mechanical-engineering-2", "electric-engine", "low-density-structure", parts.gyroscope, mods["space-exploration"] and "se-rocket-science-pack"},
        unit =
        {
          count = 100,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            mods["space-exploration"] and {"se-rocket-science-pack", 1}
          },
          time = 30
        },
        order = "e"
      }
    })
  end
end