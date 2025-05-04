-- Space age overrides

data.extend({
{
    type = "technology",
    name = "aluminium-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__factorioplus__/graphics/technology/aluminium-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "aluminium-plate",
        change = 0.1
      },
    },
    prerequisites = {"production-science-pack", "metallurgic-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"metallurgic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  })