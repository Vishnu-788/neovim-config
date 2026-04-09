return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "nvimdev/lspsaga.nvim", opts = {} },
	},
	config = function()
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		})

		-- Each language file handles its own vim.lsp.config + vim.lsp.enable
		require("plugins.lsp.python")
		require("plugins.lsp.java")
		require("plugins.lsp.go")
		require("plugins.lsp.typescript")
	end,
}
