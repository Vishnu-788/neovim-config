return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      -- Web & UI (Handled by Prettier)
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      angular = { "prettier" },
      -- Backend
      python = { "isort", "black" }, -- Sorts imports, then formats code
      go = { "gofmt" }, -- Standard Go formatting
      java = { "google-java-format" }, -- Standard Java formatting
      kotlin = { "ktlint" },
    },
    -- format_on_save = {
    --   lsp_fallback = false, -- We set this to false so LSPs don't fight with our formatters
    --   timeout_ms = 1000,
    -- },
  },
}
