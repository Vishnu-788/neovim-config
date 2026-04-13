return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/nvim-treesitter",
    })

    require("nvim-treesitter.install").install({
      "javascript", "typescript", "tsx", "jsx",
      "html", "css", "java", "rust", "json", "lua",
    })
  end,
}
