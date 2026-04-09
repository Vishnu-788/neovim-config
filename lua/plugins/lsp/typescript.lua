local shared = require("lsp.shared")

vim.lsp.config("ts_ls", {
	on_attach = shared.on_attach,
	capabilities = shared.capabilities,
})

vim.lsp.enable("ts_ls")
