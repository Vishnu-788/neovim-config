local shared = require("lsp.shared")

return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = shared.on_attach,
				capabilities = shared.capabilities,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = { command = "clippy" },
						cargo = { allFeatures = true },
					},
				},
			},
		}
	end,
}
