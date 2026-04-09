-- 1. Load your basic settings (numbers, tabs, etc.)
require("config.options")

-- 2. Load your custom keybinds
require("config.keymaps")

-- 3. Load your autocommands
require("config.autocmds")

-- 4. Load the plugin manager (Lazy)
-- This will automatically look into your lua/plugins/ folder
require("config.lazy")

vim.cmd.colorscheme("onedark")
