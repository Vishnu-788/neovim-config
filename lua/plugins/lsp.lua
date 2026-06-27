return {
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
         "saghen/blink.cmp",
      },
      config = function()
         vim.diagnostic.config({
            signs = {
               text = {
                  [vim.diagnostic.severity.ERROR] = "\u{f057} ", --
                  [vim.diagnostic.severity.WARN]  = "\u{f071} ", --
                  [vim.diagnostic.severity.INFO]  = "\u{f059} ", --
                  [vim.diagnostic.severity.HINT]  = "\u{f0eb} ", --
               },
               linehl = {},                                      -- no full-line highlight
               numhl = {},                                       -- no line-number highlight
            },
            virtual_text = true,                                -- removes the inline "W" / "E" text on the right
            underline = true,
            update_in_insert = false,
            severity_sort = true,
         })

         -- Colored sign column bars
         vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#f38ba8", bold = true })
         vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#f9e2af", bold = true })
         vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#89b4fa", bold = true })
         vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#a6e3a1", bold = true })
      end,
   },
   {
      "mason-org/mason.nvim",
      opts = {
         ui = {
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗",
            },
         },
      },
   },
   {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
         "mason-org/mason.nvim",
         "neovim/nvim-lspconfig",
      },
      event = { "BufReadPre", "BufNewFile" },
      opts = {
         ensure_installed = {
            "lua_ls",                 -- Lua (Needed for your Neovim config!)
            "pyright",                -- Python
            "html",                   -- HTML
            "ts_ls",                  -- TypeScript / JavaScript / React
            "gopls",                  -- Go (Golang)
            "kotlin_language_server", -- Kotlin
            "jdtls",                  -- Java
            "angularls",              -- Angular
         },
         automatic_enable = true,
      }
   }
}
