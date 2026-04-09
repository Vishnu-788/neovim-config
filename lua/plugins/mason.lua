return {
	-- Mason core
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
			ensure_installed = {
				-- LSP servers
				"pyright",
				"jdtls",
				"gopls",
				"ts_ls",
				"rust-analyzer",
				-- Formatters
				"black",
				"gofumpt",
				"google-java-format",
				"prettier",
            "rustfmt",
            --Linters
            "ruff",           -- Python
            "eslint_d",       -- JS/TS
            "golangci-lint",  -- Go
            "checkstyle",    
			},
		},
	},

	-- Formatting on save
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				python = { "black" },
				go = { "gofumpt" },
				java = { "google-java-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
			},
		},
	},
}
