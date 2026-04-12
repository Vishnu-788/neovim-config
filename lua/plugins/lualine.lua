return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local colors = {
      bg          = "#1e1e2e",
      fg          = "#cdd6f4",
      yellow      = "#f9e2af",
      cyan        = "#89dceb",
      darkblue    = "#11111b",
      green       = "#a6e3a1",
      orange      = "#fab387",
      violet      = "#cba6f7",
      magenta     = "#f5c2e7",
      blue        = "#89b4fa",
      red         = "#f38ba8",
      pinkish_red = "#f06292", -- The custom spicy pinkish-red!
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        globalstatus = true,
        component_separators = "",
        section_separators = "",
        theme = {
          normal   = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        lualine_a = {}, lualine_b = {}, lualine_y = {},
        lualine_z = {}, lualine_c = {}, lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_y = {},
        lualine_z = {}, lualine_c = {}, lualine_x = {},
      },
    }

    local function ins_left(component) table.insert(config.sections.lualine_c, component) end
    local function ins_right(component) table.insert(config.sections.lualine_x, component) end

    ins_left {
      "mode",
      color = function()
        local mode_color = {
          n      = colors.violet,       -- Normal is Violet
          i      = colors.green,
          v      = colors.cyan,         -- Visual is Cyan
          ["\22"] = colors.cyan,        -- Visual Block
          V      = colors.cyan,         -- Visual Line
          c      = colors.pinkish_red,  -- Command is Pinkish-Red
          no     = colors.violet,
          s      = colors.orange,
          S      = colors.orange,
          ["\19"] = colors.orange,
          ic     = colors.yellow,
          R      = colors.red,
          Rv     = colors.red,
          cv     = colors.pinkish_red,
          ce     = colors.pinkish_red,
          r      = colors.blue,
          rm     = colors.blue,
          ["r?"] = colors.blue,
          ["!"]  = colors.pinkish_red,
          t      = colors.pinkish_red,
        }
        return { bg = mode_color[vim.fn.mode()], fg = colors.darkblue, gui = "bold" }
      end,
      padding = { left = 1, right = 1 },
    }

    ins_left {
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.magenta, gui = "bold" },
      padding = { left = 1, right = 1 },
    }

    ins_left { "location", color = { fg = colors.fg } }
    ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

    ins_left {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        error = { fg = colors.red },
        warn  = { fg = colors.yellow },
        info  = { fg = colors.cyan },
      },
    }

    ins_left { function() return "%=" end }

    ins_left {
      function()
        local msg = "No LSP"
        local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon  = " LSP:",
      color = { fg = colors.cyan, gui = "bold" },
    }

    ins_right {
      "filetype",
      colored = true,
      icon_only = false,
      color = { fg = colors.fg, gui = "bold" },
      padding = { left = 1, right = 1 },
    }

    ins_right {
      "branch",
      icon  = "",
      color = { fg = colors.violet, gui = "bold" },
    }

    ins_right {
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
      diff_color = {
        added    = { fg = colors.green },
        modified = { fg = colors.orange },
        removed  = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }

    lualine.setup(config)
  end,
}
