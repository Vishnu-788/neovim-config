local options = {
  formatters_by_ft = {
    javascript      = { "prettier" },
    typescript      = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json            = { "prettier" },
    css             = { "prettier" },
    html            = { "prettier" },
  },
  -- No format_on_save here
}

return options
