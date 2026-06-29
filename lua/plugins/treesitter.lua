return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         -- 1. Enable Neovim's native highlighting globally
         vim.api.nvim_create_autocmd("FileType", {
            callback = function()
               pcall(vim.treesitter.start)
            end,
         })

         -- 2. Define your core language stack
         local parsers = {
            "java", "go", "python", "rust",
            "javascript", "typescript", "tsx",
            "html", "css", "json", "yaml", "markdown",
            "dockerfile", "bash", "lua", "c"
         }

         -- 3. Install missing parsers automatically using the updated API
         local already_installed = require("nvim-treesitter.config").get_installed()
         local to_install = vim.iter(parsers):filter(function(parser)
            return not vim.tbl_contains(already_installed, parser)
         end):totable()

         if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
         end
      end,
   }
}
