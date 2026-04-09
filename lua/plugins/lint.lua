return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufWritePost" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python     = { "ruff" },       -- fast Python linter (replaces flake8)
            java       = { "checkstyle" },
            javascript = { "eslint_d" },   -- eslint daemon, much faster than eslint
            typescript = { "eslint_d" },
            go         = { "golangcilint" },
        }

        -- Run linter on these events
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end
}
