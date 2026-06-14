local parts = require("variable-parts")

local stacksize_override = nil
if mods["Krastorio2"] then
  --stacksize_override = tonumber(settings.startup["kr-stack-size"].value)
end

data:extend({
  {
    type = "item",
    name = "invar-valve",
    icon = "__Ultimate_Intermediates__/graphics/icons/invar-valve.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "cf",
    stack_size = 50
  },
  {
    type = "item-subgroup",
    name = "engine-components",
    group = "intermediate-products",
    order = "fx"
  },
  {
    type = "item-subgroup",
    name = "articulated-components",
    group = "intermediate-products",
    order = "fy"
  },
  {
    type = "item-subgroup",
    name = "plumbing-components",
    group = "intermediate-products",
    order = "fz"
  }
})

if not mods["aai-industry"] then
  data:extend({
    {
      type = "item",
      name = "motor",
      icon = "__Ultimate_Intermediates__/graphics/icons/motor.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      localised_name = {"item-name.motor-nickel"}, --different locale key to avoid overriding "single cylinder engine" text
      --gear = c
      order = "cb",
      stack_size = 100
    }
  })
end

if parts.nickelExperimental then
  data:extend({
    {
      type = "item",
      name = "motorized-articulator",
      icon = "__Ultimate_Intermediates__/graphics/icons/motorized-articulator.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "gb",
      stack_size = 50
    },
    {
      type = "item",
      name = "flow-controller",
      icon = "__Ultimate_Intermediates__/graphics/icons/flow-controller.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "cg",
      stack_size = 50
    },
    {
      type = "item",
      name = "cooling-fan",
      icon = "__Ultimate_Intermediates__/graphics/icons/cooling-fan.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "ch",
      stack_size = 50
    },
    {
      type = "item",
      name = "gimbaled-thruster",
      icon = "__Ultimate_Intermediates__/graphics/icons/gimbaled-thruster.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "na",
      stack_size = mods["LunarLandings"] and 20 or 10
    }
  })

  if mods["LunarLandings"] then
    data:extend({
      {
        type = "item",
        name = "gimbaled-thruster-packed",
        icon = "__Ultimate_Intermediates__/graphics/icons/gimbaled-thruster-packed.png",
        icon_size = 64,
        subgroup = "ll-packed-rocket-ingredients",
        order = "z",
        stack_size = 4
      }
    })
  end

  if not mods["galdocs-manufacturing"] then
    data:extend({
      {
        type = "item",
        name = "machining-tool",
        icon = "__Ultimate_Intermediates__/graphics/icons/machining-tool.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "nb",
        stack_size = 50
      },
      {
        type = "item",
        name = "advanced-machining-tool",
        icon = "__Ultimate_Intermediates__/graphics/icons/advanced-machining-tool.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "nc",
        stack_size = 50
      }
    })
  end
end

if mods["space-exploration"] then
  data:extend({
    {
        type = "item-subgroup",
        name = "nickel",
        group = "resources",
        order = "a-h-z-a2",
    }
  })

  if parts.nickelExperimental then
    data:extend({
      {
        type = "item",
        name = "advanced-flow-controller",
        icon = "__Ultimate_Intermediates__/graphics/icons/advanced-flow-controller.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "cga",
        stack_size = 50
      },
      {
        type = "item",
        name = "nickel-electromagnet",
        icon = "__Ultimate_Intermediates__/graphics/icons/nickel-electromagnet.png",
        icon_size = 64,
        subgroup = "electronic",
        order = "b-02-b",
        stack_size = 100
      }
    })
  end
end

if parts.nitinol then
  data:extend({
    {
      type = "item",
      name = "nitinol-plate",
      icon = "__Ultimate_Intermediates__/graphics/icons/nitinol-plate.png",
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "???",
      stack_size = stacksize_override or 100
    },
    {
      type = "item",
      name = "nitinol-mesh",
      icon = "__Ultimate_Intermediates__/graphics/icons/nitinol-mesh.png",
      icon_size = 64,
      subgroup = "advanced-assembling",
      order = "g",
      stack_size = 50
    },
    {
      type = "item",
      name = "self-regulating-valve",
      icon = "__Ultimate_Intermediates__/graphics/icons/self-regulating-valve.png",
      icon_size = 64,
      subgroup = "advanced-assembling",
      order = "h",
      stack_size = 50
    }
  })
  if not (parts.foundryEnabled or mods["Krastorio2"]) then
    data:extend({
      {
        type = "item",
        name = "nitinol-precursor",
        icon = "__Ultimate_Intermediates__/graphics/icons/nitinol-precursor.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "???",
        stack_size = 50
      }
    })
  end
end
