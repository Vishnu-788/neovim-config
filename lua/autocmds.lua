local autocmd = vim.api.nvim_create_autocmd

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
   group = lint_augroup,
   callback = function()
      require("lint").try_lint()
   end,
})

autocmd("CursorHold", {
   callback = function()
      vim.diagnostic.open_float(nil, { focus = false })
   end,
})


autocmd("ColorScheme", {
   pattern = "*",
   callback = function()
      vim.api.nvim_set_hl(0, "Visual", { bg = "#3d3458", fg = "NONE" })
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'NONE', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'VertSplit', { fg = 'NONE', bg = 'NONE' })
   end,
})
