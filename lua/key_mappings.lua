vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true, desc = "Open netrw" })

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
  require("conform").format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = "Format file or range" })

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })


-- Change your Telescope keymaps to this structure:
local telescope = function(func)
  return function()
    require('telescope.builtin')[func]()
  end
end

vim.keymap.set('n', '<leader>ff', telescope('find_files'), { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fo', telescope('oldfiles'), { desc = 'List previously opened files'})
vim.keymap.set('n', '<leader>fg', telescope('live_grep'), { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope('buffers'), { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope('help_tags'), { desc = 'Telescope help tags' })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result and center" })

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- You might as well add up and down while you're at it!
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
