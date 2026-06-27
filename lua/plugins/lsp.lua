return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      }
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
        "lua_ls", -- Lua (Needed for your Neovim config!)
        "pyright", -- Python
        "html", -- HTML
        "ts_ls", -- TypeScript / JavaScript / React
        "gopls", -- Go (Golang)
        "kotlin_language_server", -- Kotlin
        "jdtls", -- Java
        "angularls", -- Angular
      },
      automatic_enable = true,
    },
  },
}
