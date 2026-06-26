require "nvchad.options"

-- add yours here!
vim.opt.relativenumber = true
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.tabstop = 3      -- Visual width of a tab
vim.opt.softtabstop = 3  -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 3   -- Number of spaces used for auto-indentation
vim.opt.expandtab = true -- Turn tabs into spaces

vim.opt.scrolloff = 999  -- Keeps the cursor vertically centered
vim.opt.wrap = false

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block-blinkwait700-blinkoff400-blinkon250,r-cr-o:hor20"
