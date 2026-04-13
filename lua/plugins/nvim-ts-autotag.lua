-- Add this to your lazy.nvim plugin list
return {
  "windwp/nvim-ts-autotag",
  config = function()
    require('nvim-ts-autotag').setup({
      opts = {
        -- Defaults to true, but good to be explicit
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    })
  end,
}
