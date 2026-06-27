local function set_italic_highlights()
  local italics = {
    -- Keywords
    "@keyword",                  -- if, else, while, for, do
    "@keyword.function",         -- function, def, fun, fn
    "@keyword.return",           -- return, yield
    "@keyword.conditional",      -- if, else, elif, switch, case
    "@keyword.repeat",           -- for, while, loop
    "@keyword.import",           -- import, require, use, from
    "@keyword.operator",         -- and, or, not, in, is
    "@keyword.exception",        -- try, catch, throw, raise, finally

    -- OOP
    "@keyword.class",            -- class
    "@type",                     -- type names
    "@type.builtin",             -- int, str, bool, void
    "@constructor",              -- constructors

    -- Others that look great in italic
    "@variable.builtin",         -- self, this, super
    "@constant.builtin",         -- true, false, null, nil, None
    "@attribute",                -- decorators (@annotation in Java)
    "Comment",                   -- comments always look great italic
  }

  for _, group in ipairs(italics) do
    vim.api.nvim_set_hl(0, group, {
      italic = true,
      -- preserve existing fg color, just add italic
      fg = vim.api.nvim_get_hl(0, { name = group, link = false }).fg,
    })
  end
end

-- Re-apply on colorscheme change so it survives theme reloads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_italic_highlights,
})

-- Apply immediately on load
set_italic_highlights()
