return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled",
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,
        styles = {
          comments  = "italic",
          keywords  = "bold",
          functions = "NONE",
          strings   = "NONE",
          variables = "NONE",
        },
      },
      groups = {
        carbonfox = {
          -- Argonaut Background Overrides
          Normal          = { bg = "#0e1019" },
          NormalNC        = { bg = "#0e1019" },
          SignColumn      = { bg = "#0e1019" },
          EndOfBuffer     = { bg = "#0e1019" },
          NvimTreeNormal  = { bg = "#0e1019" },
          NeoTreeNormal   = { bg = "#0e1019" },
          NeoTreeNormalNC = { bg = "#0e1019" },

          -- Folder Tree Highlights (Light Green Icons)
          Directory                = { fg = "#a6e22e" },
          NvimTreeFolderIcon       = { fg = "#a6e22e" },
          NvimTreeFolderName       = { fg = "#fffaf4" },
          NvimTreeOpenedFolderName = { fg = "#00d8eb", style = "bold" },
          NvimTreeEmptyFolderName  = { fg = "#444444" },
          NvimTreeRootFolder       = { fg = "#ffb900", style = "bold" },
          NeoTreeDirectoryIcon     = { fg = "#a6e22e" },
          NeoTreeDirectoryName     = { fg = "#fffaf4" },
          NeoTreeRootName          = { fg = "#ffb900", style = "bold" },

          -- Your Original Tweaks
          Comment      = { fg = "#6e6e6e", style = "italic" },
          CursorLineNr = { fg = "#78a9ff", style = "bold" },

          -- Rust-Specific 'fn' Keyword (Tokyo Night Purple)
        },
      },
      palettes = {},
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.cmd.colorscheme("carbonfox")
    end,
  },
}
