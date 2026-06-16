local parts = require("variable-parts")

local stacksize_override = nil

data:extend({
  {
    type = "item",
    name = "bolted-flange",
    icon = parts.qualityIconPath("brasstacks", "icons/bolted-flange.png"),
    icon_size = 64,
    subgroup = "intermediate-product",
    --gear = c
    order = "cc",
    stack_size = 100
  },
  {
    type = "item",
    name = "brass-balls",
    icon = parts.qualityIconPath("brasstacks", "icons/brass-balls.png"),
    icon_size = 64,
    subgroup = "intermediate-product",
    --engine = i
    order = "ia",
    stack_size = 200
  },
  {
    type = "item",
    name = "bearing",
    icon = parts.qualityIconPath("brasstacks", "icons/bearing.png"),
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "ib",
    stack_size = 100
  },
  {
    type = "item-subgroup",
    name = "frame-components",
    group = "intermediate-products",
    order = "fu"
  },
  {
    type = "item-subgroup",
    name = "gear-components",
    group = "intermediate-products",
    order = "fv"
  },
  {
    type = "item-subgroup",
    name = "rotary-components",
    group = "intermediate-products",
    order = "fw"
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

if parts.bz.carbon or mods["BrimStuff-Updated"] then
  data:extend({
    {
      type = "item",
      name = "airtight-seal",
      icon = parts.qualityIconPath("brasstacks", "icons/airtight-seal.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "cd",
      stack_size = 100
    }
  })
end

if parts.brassExperimental then
  data:extend({
    {
      type = "item",
      name = "articulated-mechanism",
      icon = parts.qualityIconPath("brasstacks", "icons/articulated-mechanism.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "cb",
      stack_size = 100
    },
    {
      type = "item",
      name = "flywheel",
      icon = parts.qualityIconPath("brasstacks", "icons/flywheel.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "ce",
      stack_size = 50
    },
    {
      type = "item",
      name = "hardened-hull",
      icon = parts.qualityIconPath("brasstacks", "icons/hardened-hull.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "ga",
      stack_size = 50
    },
    {
      type = "item",
      name = "complex-joint",
      icon = parts.qualityIconPath("brasstacks", "icons/complex-joint.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "gc",
      stack_size = 50
    },
    {
      type = "item",
      name = "gearbox",
      icon = parts.qualityIconPath("brasstacks", "icons/gearbox.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "gd",
      stack_size = 50
    },
    {
      type = "item",
      name = "advanced-gearbox",
      icon = parts.qualityIconPath("brasstacks", "icons/advanced-gearbox.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "ge",
      stack_size = 50
    }
  })

  if mods["Krastorio2"] then
    data:extend({
      {
        type = "item",
        name = "elite-gearbox",
        icon = parts.qualityIconPath("brasstacks", "icons/elite-gearbox.png"),
        icon_size = 64,
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = parts.qualityIconPath("brasstacks", "icons/elite-gearbox.png"),
              scale = 0.25
            },
            {
              filename = parts.qualityIconPath("brasstacks", "icons/elite-gearbox-glow.png"),
              size = 64,
              scale = 0.25,
              flags = {"light"},
              draw_as_light = true
            }
          }
        },
        subgroup = "intermediate-product",
        order = "gf",
        stack_size = 50
      }
    })
  end

  if parts.gyroscope then
      data:extend({
        {
          type = "item",
          name = parts.gyroscope,
          localised_name = {"item-name.gyroscope"},
          icon = parts.qualityIconPath("brasstacks", "icons/gyroscope.png"),
          icon_size = 64,
          subgroup = "intermediate-product",
          order = "gca",
          stack_size = 50
        }
    })
  end

  if mods["aai-signal-transmission"] or mods["LunarLandings"] then
    data:extend({
      {
        type = "item",
        name = "skyseeker-armature",
        icon = parts.qualityIconPath("brasstacks", "icons/skyseeker-armature.png"),
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "gcb",
        stack_size = 10
      }
  })
  end
end

if parts.drill then
  data:extend({
    {
      type = "item",
      name = "industrial-drill-head",
      icon = parts.qualityIconPath("brasstacks", "icons/industrial-drill-head.png"),
      icon_size = 64,
      subgroup = "intermediate-product",
      order = "ea3",
      stack_size = 50
    }
  })
end