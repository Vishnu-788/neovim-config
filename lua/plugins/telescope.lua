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

            layout_config = {
               vertical = {
                  -- Adjust these to your preference
                  width = 0.9,
                  height = 0.9,
                  preview_height = 0.5, -- Preview window takes up 50% of the height
                  mirror = true,        -- Setting mirror to true often places results on top
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

   -- This config function takes the 'opts' you built above and applies the custom UI colors
   config = function(_, opts)
      require("telescope").setup(opts)

      -- 1. The main background and border for all Telescope windows
      vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })

      -- 2. The Prompt Panel (Bottom/Top search box)
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "Title" })

      -- 3. The Results Panel (List of files)
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "Title" })

      -- 4. The Preview Panel (File contents)
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "Title" })

      -- 5. Selection highlighting (matches your PmenuSel/CursorLine)
      vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })
      vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { link = "Special" })
   end,
}
