vim.opt.guicursor = "n-v-c:block,i-ci-ve:block-blinkwait700-blinkoff400-blinkon250,r-cr:hor20,o:hor50"

vim.opt.relativenumber = true
vim.opt.number = true

-- Set tab width to 3 spaces
vim.opt.tabstop = 3         -- Number of spaces a <Tab> counts for in a file
vim.opt.shiftwidth = 3      -- Number of spaces for each step of (auto)indent
vim.opt.softtabstop = 3     -- Number of spaces a <Tab> counts for when editing
vim.opt.expandtab = true    -- Convert tabs to spaces (standard for most languages)

vim.opt.scrolloff = 999 
vim.opt.wrap = false
vim.opt.sidescrolloff = 8

vim.opt.fillchars:append({
  vert = " ",
  vertleft = " ",
  vertright = " ",
  verthoriz = " "
})
