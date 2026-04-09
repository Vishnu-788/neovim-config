local shared = require("lsp.shared")

vim.lsp.config("jdtls", {
	on_attach = shared.on_attach,
	capabilities = shared.capabilities,
})

vim.lsp.enable("jdtls")
