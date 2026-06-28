return {
   -- 1. Main LSPConfig & Diagnostics Setup
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         vim.diagnostic.config({
            signs = {
               text = {
                  [vim.diagnostic.severity.ERROR] = "\u{f057} ",
                  [vim.diagnostic.severity.WARN]  = "\u{f071} ",
                  [vim.diagnostic.severity.INFO]  = "\u{f059} ",
                  [vim.diagnostic.severity.HINT]  = "\u{f0eb} ",
               },
               linehl = {},
               numhl = {},
            },
            virtual_text = true,
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

   -- 2. Mason Setup
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

   -- 3. Mason LSPConfig & Auto-Handlers
   {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
         "mason-org/mason.nvim",
         "neovim/nvim-lspconfig",
         "saghen/blink.cmp", -- Needed to hook up autocompletion capabilities
      },
      opts = {
         ensure_installed = {
            "lua_ls", "pyright", "html", "ts_ls",
            "gopls", "kotlin_language_server", "angularls", "jdtls"
         },
         automatic_enable = {
            exclude = {
               'jdtls'
            }
         }
      }
      -- config = function()
      --    -- Grab capabilities from blink.cmp
      --    local capabilities = require("blink.cmp").get_lsp_capabilities()
      --
      --    require("mason-lspconfig").setup({
      --       ensure_installed = {
      --          "lua_ls", "pyright", "html", "ts_ls",
      --          "gopls", "kotlin_language_server", "angularls",
      --       },
      --       handlers = {
      --          ["gopls"] = function()
      --             require("lspconfig").gopls.setup({
      --                capabilities = capabilities,
      --                settings = {
      --                   gopls = {
      --                      analyses = {
      --                         unusedparams = true,
      --                      },
      --                      staticcheck = true,
      --                      gofumpt = true,
      --                   },
      --                },
      --             })
      --          end,
      --       },
      --    })
      -- end,
   },
   {'mfussenegger/nvim-jdtls'}

}
