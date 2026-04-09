local shared = require("lsp.shared")

vim.lsp.config("gopls", {
	on_attach = shared.on_attach,
	capabilities = shared.capabilities,
	settings = {
		gopls = {
			analyses = { unusedparams = true },
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.enable("gopls")
