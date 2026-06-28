return {
   {
      "echasnovski/mini.icons",
      version = "*",
      config = function()
         require("mini.icons").setup()
         -- Makes it a drop-in replacement for nvim-web-devicons
         MiniIcons.mock_nvim_web_devicons()
      end
   },
   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
         "echasnovski/mini.icons",
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
