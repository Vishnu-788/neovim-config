return {
   {
      "nvim-tree/nvim-web-devicons",
      config = function()
         require("nvim-web-devicons").setup({
            -- Your personal icons go here to override the defaults
            override = {
               zsh = {
                  icon = "",
                  color = "#428850",
                  cterm_color = "65",
                  name = "Zsh"
               }
            },
            -- Globally enable different highlight colors per icon
            color_icons = true,
            -- Globally enable default icons (will get overridden by specific icons)
            default = true,
         })
      end
   },
   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("nvim-tree").setup({
            hijack_unnamed_buffer_when_opening = false,
            hijack_directories = {
               enable = false,
            },
            view = {
               width = 40,
               signcolumn = "yes",
            },
            renderer = {
               highlight_git = true,
               icons = {
                  show = {
                     git = false,
                     diagnostics = true,
                     file = true,
                     folder = true,
                  },
               },
            },
            diagnostics = {
               enable = true,
               show_on_dirs = true,
               severity = {
                  min = vim.diagnostic.severity.ERROR,
               },
               icons = {
                  hint = "󰌵",
                  info = "",
                  warning = "󰀪",
                  error = "✖",
               },
            },
         })
      end,
   },
}
