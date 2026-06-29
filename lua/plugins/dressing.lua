return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    select = {
      -- Tells dressing to use telescope's UI style if available
      backend = { "telescope", "builtin" },
      builtin = {
        max_height = 6, -- This restricts the menu height perfectly!
      },
    },
  },
}
