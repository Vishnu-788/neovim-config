-- Using Lazy
-- return {
-- 	"navarasu/onedark.nvim",
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		require("onedark").setup({
-- 			style = "deep",
-- 		})
-- 		require("onedark").load()
-- 	end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- }
return {
    'marko-cerovac/material.nvim',
    lazy = false,        -- load at startup (it's a colorscheme)
    priority = 1000,     -- load before other plugins
    opts = {
        contrast = {
            terminal = false,
            sidebars = true,
            floating_windows = false,
            cursor_line = true,
        },
        styles = {
            comments = { italic = true },
            keywords = { bold = true },
        },
        plugins = {        -- enable material styling for these plugins
            "nvim-tree",
            "telescope",
        },
        disable = {
            colored_cursor = false,
            borders = false,
            background = false,
        },
        high_visibility = {
            lighter = false,
            darker = false,
        },
        lualine_style = "default",   -- "default" | "stealth"
        async_loading = true,
        custom_colors = nil,
        custom_highlights = {},
    },
    config = function(_, opts)
        require('material').setup(opts)

        -- Pick your style: 'darker' | 'lighter' | 'oceanic' | 'palenight' | 'deep ocean'
        vim.g.material_style = "deep ocean"
        vim.cmd('colorscheme material')
    end,
}
