return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      enabled = false, -- This disables the indent lines entirely
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            mirror = false,
            preview_cutoff = 0,
            prompt_position = "top",
          },
        },
      },
    },
  },

  -- lua/plugins/init.lua
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true, -- auto close tags
          enable_rename = true, -- rename closing tag when you rename opening
          enable_close_on_slash = false, -- close on </
        },
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 45,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            git = false, -- Disables Git symbols entirely
            diagnostics = true, -- Ensures your ?, i, !, X still show up
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "?",
          info = "i",
          warning = "!",
          error = "X",
        },
      },
    },
  },

  -- FIXED: Added indent-blankline and set enabled to false to disable the guidelines
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {
    enabled = false,
  } },

  -- FIXED: This block was missing a plugin name and had syntax errors.
  -- Commented out to prevent crashes. (Looks like neoscroll.nvim settings?)
  -- {
  --   "YOUR_SCROLL_PLUGIN_HERE",
  --   opts = {
  --     duration_multiplier = 1.0, -- Global duration multiplier
  --     easing = "linear", -- Default easing function
  --     pre_hook = nil, -- Function to run before the scrolling animation starts
  --     post_hook = nil, -- Function to run after the scrolling animation ends
  --     performance_mode = false, -- Disable "Performance Mode" on all buffers.
  --     ignored_events = { -- Events ignored while scrolling
  --       "WinScrolled",
  --       "CursorMoved",
  --     },
  --   }
  -- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  }, -- FIXED: Uncommented the closing brace here

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  }
}
