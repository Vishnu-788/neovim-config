local autocmd = vim.api.nvim_create_autocmd

-- Debugging block: Check if golangci-lint is visible to Neovim
autocmd("BufEnter", {
  pattern = "*.go",
  callback = function()
    local mason_path = vim.fn.stdpath("data") .. "/mason/bin/golangci-lint"
    local is_executable = vim.fn.executable(mason_path)
    
    if is_executable == 0 then
      vim.notify("DEBUG: golangci-lint NOT FOUND at " .. mason_path, vim.log.levels.ERROR)
    else
      vim.notify("DEBUG: golangci-lint FOUND at " .. mason_path, vim.log.levels.INFO)
    end
  end,
})

-- Auto-linting on save or leaving insert mode
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

-- Auto-hover diagnostics
autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})


-- Fix Visual mode selection colors (prevent rainbow bleed-through from semantic tokens)
autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Visual", { bg = "#3d3458", fg = "NONE" })
  end,
})
