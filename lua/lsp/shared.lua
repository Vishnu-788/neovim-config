-- ~/.config/nvim/lua/lsp/shared.lualocal M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.on_attach = function(_, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- NAVIGATION
	map("gd", vim.lsp.buf.definition, "Go to Definition")
	map("gD", vim.lsp.buf.declaration, "Go to Declaration")
	map("gr", vim.lsp.buf.references, "Go to References")
	map("gi", vim.lsp.buf.implementation, "Go to Implementation")
	map("gt", vim.lsp.buf.type_definition, "Go to Type Definition")

	-- INFORMATION
	map("K", vim.lsp.buf.hover, "Hover Docs")
	map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
	map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")

	-- CODE ACTIONS (via lspsaga)
	map("<leader>ca", "<cmd>Lspsaga code_action<cr>", "Code Action")
	map("<leader>rn", "<cmd>Lspsaga rename<cr>", "Rename Symbol")
	map("<leader>pd", "<cmd>Lspsaga peek_definition<cr>", "Peek Definition")
	map("<leader>ol", "<cmd>Lspsaga outline<cr>", "Toggle Outline")

	-- DIAGNOSTICS
	map("<leader>e", vim.diagnostic.open_float, "Show Diagnostics")
	map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
	map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
	map("<leader>q", vim.diagnostic.setloclist, "Diagnostics List")

	-- FORMATTING
	map("<leader>f", function()
		require("conform").format({ async = true, lsp_fallback = true })
	end, "Format File")
end

return M
