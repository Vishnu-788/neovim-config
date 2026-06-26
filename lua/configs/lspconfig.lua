require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",      -- TypeScript/JavaScript/React (TSX/JSX)
  "gopls",      -- Go
  "jdtls",      -- Java
  "pyright",
  "kotlin-language-server",
}

vim.lsp.enable(servers)-- read :h vim.lsp.config for changing options of lsp servers 
