return {
   "goolord/alpha-nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify") -- or .dashboard, depending on what you use

      -- Replace the default header with your new ASCII art
      dashboard.section.header.val = {

         [[                                                                       ]],
         [[                                                                     ]],
         [[       ████ ██████           █████      ██                     ]],
         [[      ███████████             █████                             ]],
         [[      █████████ ███████████████████ ███   ███████████   ]],
         [[     █████████  ███    █████████████ █████ ██████████████   ]],
         [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
         [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
         [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
         [[                                                                       ]],
      }
      dashboard.section.header.opts.position = "center"
      alpha.setup(dashboard.opts)
   end,
}
