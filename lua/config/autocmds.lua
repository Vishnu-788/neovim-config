-- config/autocmds.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript", "typescript", "tsx", "jsx",
    "html", "css", "java", "rust", "json", "lua",
  },
  callback = function()
    vim.treesitter.start()
  end,
})
