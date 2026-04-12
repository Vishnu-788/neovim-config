vim.opt.number = true -- Shows the absolute line number for the current line
vim.opt.relativenumber = true -- Shows relative numbers for all other lines

vim.opt.tabstop = 3 -- tab character width
vim.opt.shiftwidth = 3 -- indent size (<<, >>, autoindent)
vim.opt.softtabstop = 3 -- spaces inserted when pressing Tab
vim.opt.expandtab = false -- use spaces instead of tab characters
vim.opt.signcolumn = "no"  -- ← add this

vim.opt.fillchars = {
    eob     = " ",   -- end of buffer (the ~ lines)
    vert    = "│",   -- vertical split separator
    fold    = " ",   -- fold fill character
    diff    = "╱",   -- deleted lines in diff mode
}

