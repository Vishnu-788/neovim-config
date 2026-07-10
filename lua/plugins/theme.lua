return {
   { 'nvim-treesitter/nvim-treesitter', build = ':tsupdate' },
   {
      "baliestri/aura-theme",
      lazy = false,
      priority = 1000,
      config = function(plugin)
         vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
         vim.cmd([[colorscheme aura-dark]])

         -- Make background transparent
         vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
         vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
         vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
         vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })

         -- Optional: Ensure LineNr is also transparent if you have line numbers enabled
         vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
      end
   }
}
