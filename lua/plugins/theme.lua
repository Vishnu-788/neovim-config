return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", 
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = {},
        variables = {},
      },
      
      -- Hijack the base colors for the Argonaut background
      on_colors = function(colors)
        colors.bg = "#0e1019"
        colors.bg_dark = "#0e1019"   
        colors.bg_float = "#0e1019"  
      end,

      -- Apply your specific highlight overrides
      on_highlights = function(hl, c)
        -- Folder Tree Highlights (Now in Tokyo Night Purple)
        hl.Directory                = { fg = "#bb9af7" } 
        hl.NvimTreeFolderIcon       = { fg = "#bb9af7" } 
        hl.NvimTreeFolderName       = { fg = "#fffaf4" }
        hl.NvimTreeOpenedFolderName = { fg = "#00d8eb", bold = true }
        hl.NvimTreeEmptyFolderName  = { fg = "#444444" }
        hl.NvimTreeRootFolder       = { fg = "#ffb900", bold = true }
        hl.NeoTreeDirectoryIcon     = { fg = "#bb9af7" } 
        hl.NeoTreeDirectoryName     = { fg = "#fffaf4" }
        hl.NeoTreeRootName          = { fg = "#ffb900", bold = true }

        -- Your Original Tweaks
        hl.Comment      = { fg = "#6e6e6e", italic = true }
        hl.CursorLineNr = { fg = "#78a9ff", bold = true }

        -- Rust-Specific 'fn' Keyword Override
        hl["@keyword.function.rust"] = { fg = "#ffb900", italic = true, bold = true }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
