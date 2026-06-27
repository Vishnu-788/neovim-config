return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      -- This forces the vertical stack (results on top, preview on bottom) layout_strategy = "vertical",
      layout_config = {
        vertical = {
          -- Adjust these to your preference
          width = 0.9,
          height = 0.9,
          preview_height = 0.5, -- Preview window takes up 50% of the height
          mirror = true, -- Setting mirror to true often places results on top
        },
      },
    },
  },
}
