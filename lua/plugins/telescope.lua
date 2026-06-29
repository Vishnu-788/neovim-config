return {
   "nvim-telescope/telescope.nvim",
   version = "*",
   dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   -- Single opts function that returns ALL your settings
   opts = function()
      local actions = require("telescope.actions")

      return {
         defaults = {
            -- FIX: Moved to a new line so it isn't commented out
            layout_config = {
               vertical = {
                  -- Adjust these to your preference
                  width = 0.9,
                  height = 0.9,
                  preview_height = 0.5, -- Preview window takes up 50% of the height
                  mirror = true,     -- Setting mirror to true often places results on top
               },
            },
            -- Mapping settings
            mappings = {
               i = {
                  ["<esc>"] = false,
               },
               n = {
                  ["<esc>"] = false,
                  ["q"] = actions.close,
               },
            },
         },
      }
   end,
}
