local shared = require("lsp.shared")

vim.lsp.config("pyright", {
	on_attach = shared.on_attach,
	capabilities = shared.capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})

vim.lsp.enable("pyright")
