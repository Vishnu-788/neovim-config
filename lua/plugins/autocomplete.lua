return {
   "saghen/blink.cmp",
   version = "*",
   event = { "InsertEnter" },
   opts = {
      keymap = {
         preset      = "default",
         ["<Tab>"]   = { "select_next", "fallback" },
         ["<S-Tab>"] = { "select_prev", "fallback" },
         ["<CR>"]    = { "accept", "fallback" },
         ["<C-b>"]   = { "scroll_documentation_up", "fallback" },
         ["<C-f>"]   = { "scroll_documentation_down", "fallback" },
         ["<C-e>"]   = { "cancel", "fallback" },
      },

      appearance = {
         use_nvim_cmp_as_default = false,
         nerd_font_variant = "mono",
         kind_icons = {
            Text          = "󰉿",
            Method        = "󰆧",
            Function      = "󰊕",
            Constructor   = "",
            Field         = "󰜢",
            Variable      = "󰀫",
            Class         = "󰠱",
            Interface     = "",
            Module        = "",
            Property      = "󰜢",
            Unit          = "󰑭",
            Value         = "󰎠",
            Enum          = "",
            Keyword       = "󰌋",
            Snippet       = "",
            Color         = "󰏘",
            File          = "󰈙",
            Reference     = "󰈇",
            Folder        = "󰉋",
            EnumMember    = "",
            Constant      = "󰏿",
            Struct        = "󰙅",
            Event         = "",
            Operator      = "󰆕",
            TypeParameter = "",
         },
      },

      sources = {
         default = { "lsp", "path", "snippets", "buffer" },
         providers = {
            lsp      = { name = "LSP", },
            path     = { name = "Path", },
            snippets = { name = "Snippet", },
            buffer   = { name = "Buffer", },
         },
      },

      completion = {
         documentation = {
            auto_show = true,
            auto_show_delay_ms = 100, -- faster popup
            window = {
               border       = "rounded",
               -- Docs panel sits to the RIGHT of the menu (VSCode style)
               min_width    = 50,       -- wide enough to show full signatures
               max_width    = 70,
               max_height   = 20,
               winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
               scrollbar    = true,
            },
         },

         ghost_text = { enabled = true },

         menu = {
            border             = "rounded",
            min_width          = 40,              -- wider menu
            max_height         = 20,              -- taller — shows more items at once

            direction_priority = { "s", "n" },    -- try east first, fallback west
            winhighlight       = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection",
            draw               = {
               gap = 3,
               columns = {
                  { "kind_icon",  gap = 1 },
                  { "label",      "label_description", gap = 2 },
                  { "kind",       gap = 2 },
                  { "source_name" },
               },
               components = {
                  kind_icon = {
                     ellipsis  = false,
                     text      = function(ctx) return " " .. ctx.kind_icon .. " " end,
                     highlight = function(ctx) return ctx.kind_hl end,
                  },
                  label = {
                     width     = { min = 20, max = 30 }, -- label always has room
                     text      = function(ctx) return ctx.label end,
                     highlight = "BlinkCmpLabel",
                  },
                  label_description = {
                     width     = { max = 20 },
                     text      = function(ctx) return ctx.label_description end,
                     highlight = "BlinkCmpLabelDescription",
                  },
                  kind = {
                     width     = { min = 10 },
                     text      = function(ctx) return "(" .. ctx.kind .. ")" end,
                     highlight = "BlinkCmpKind",
                  },
                  source_name = {
                     text      = function(ctx) return "[" .. ctx.source_name .. "]" end,
                     highlight = "BlinkCmpSource",
                  },
               },
               treesitter = { "lsp" },
            },
         },
      },

      -- Signature help panel (shows function args as you type)
      signature = {
         enabled = true,
         window = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
         },
      },
   },

   config = function(_, opts)
      require("blink.cmp").setup(opts)

      -- Menu
      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#1e1e2e", fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#89b4fa" }) -- blue
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#2a2a3d", bold = true })

      -- Docs panel (right side)
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#181825", fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#cba6f7" }) -- purple border (distinct from menu)

      -- Signature help (below cursor)
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "#181825", fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#a6e3a1" }) -- green

      -- Text hierarchy
      vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#cdd6f4", bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = "#6c7086", italic = true })
      vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#f9e2af", italic = true })
      vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = "#45475a" }) -- very dimmed
   end,
}
