return {
   "stevearc/conform.nvim",
   event = { "BufReadPre", "BufNewFile" },
   opts = {
      formatters_by_ft = {
         javascript = { "prettier" },
         typescript = { "prettier" },
         javascriptreact = { "prettier" },
         typescriptreact = { "prettier" },
         html = { "prettier" },
         css = { "prettier" },
         angular = { "prettier" },
         python = { "isort", "black" },
         go = { "gofmt" },
         java = { "google-java-format" },
         kotlin = { "ktlint" },
      },
   },
}
