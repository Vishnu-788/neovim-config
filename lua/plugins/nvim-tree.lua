return {
   "nvim-tree/nvim-tree.lua",
   version = "*",
   lazy = false,
   dependencies = {
      "nvim-tree/nvim-web-devicons",
   },

   config = function()
      require("nvim-tree").setup({
         view = {
            width=40,
            -- Forces the signcolumn to the far left edge for diagnostics
            signcolumn = "yes",
         },
         renderer = {
            -- Colors the file names based on their git status
            highlight_git = true,
            icons = {
               show = {
                  -- Disables git symbols (since we are using colors now)
                  git = false,
                  diagnostics = true,
               },
            },
         },
         diagnostics = {
            enable = true,
            show_on_dirs = true,
            severity = {
               min = vim.diagnostic.severity.ERROR, -- Ignores warnings, info, and hints
            },
            icons = {
               hint = "󰌵",
               info = "",
               warning = "󰀪",
               error = "✖",
            },
         },
      })
   end,
}
