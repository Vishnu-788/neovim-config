-- 1. Setup (Run this once when Neovim starts)
return {
  "stevearc/conform.nvim", -- You MUST tell it which plugin this is!
  event = { "BufReadPre", "BufNewFile" }, -- Optional: Loads it when you open a file
  config = function()
    -- Everything goes INSIDE this function
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    })

    -- Now your mapping
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format File" })
  end,
}
