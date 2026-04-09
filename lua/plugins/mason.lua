return {
    -- Mason core
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },

    -- LSP servers via Mason
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "pyright",  -- Python
                "jdtls",    -- Java
                "gopls",    -- Go
                "ts_ls",    -- TypeScript/JavaScript
            },
        }
    },

    -- Formatters installer
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "black",              -- Python formatter
                "gofumpt",            -- Go formatter
                "google-java-format", -- Java formatter
                "prettier",           -- JS/TS formatter
            },
        }
    },

    -- Formatting on save
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                python     = { "black" },
                go         = { "gofumpt" },
                java       = { "google-java-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
            },
        }
    },

    -- LSP config + keymaps + code actions
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            { "j-hui/fidget.nvim",    opts = {} }, -- LSP status spinner in corner
            { "nvimdev/lspsaga.nvim", opts = {} }, -- Better UI for code actions, rename, etc.
        },
        config = function()
            -- Shared on_attach: runs for every LSP server when it attaches to a buffer
            local on_attach = function(_, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
                end

                -- ---------------------------------------------------------
                -- NAVIGATION
                -- ---------------------------------------------------------

                -- gd: Jump to where the symbol under cursor is defined
                --     e.g. go to the function/class definition
                map('gd', vim.lsp.buf.definition, 'Go to Definition')

                -- gD: Jump to the declaration of the symbol
                --     (differs from definition in C/C++, mostly same in other langs)
                map('gD', vim.lsp.buf.declaration, 'Go to Declaration')

                -- gr: List all places in the codebase that reference this symbol
                --     Opens a quickfix list of usages
                map('gr', vim.lsp.buf.references, 'Go to References')

                -- gi: Jump to where this interface/abstract method is implemented
                --     Useful for interfaces in Java/TypeScript
                map('gi', vim.lsp.buf.implementation, 'Go to Implementation')

                -- gt: Jump to the type definition of the symbol under cursor
                --     e.g. if cursor is on a variable, goes to its type/class
                map('gt', vim.lsp.buf.type_definition, 'Go to Type Definition')

                -- ---------------------------------------------------------
                -- INFORMATION
                -- ---------------------------------------------------------

                -- K: Show hover documentation popup for the symbol under cursor
                --    Press K again to enter the popup and scroll it
                map('K', vim.lsp.buf.hover, 'Hover Docs')

                -- <leader>ds: List all symbols (functions, variables, classes)
                --             in the current file
                map('<leader>ds', vim.lsp.buf.document_symbol, 'Document Symbols')

                -- <leader>ws: Search for symbols across the entire workspace/project
                map('<leader>ws', vim.lsp.buf.workspace_symbol, 'Workspace Symbols')

                -- ---------------------------------------------------------
                -- CODE ACTIONS & REFACTORING (via lspsaga for better UI)
                -- ---------------------------------------------------------

                -- <leader>ca: Show available code actions at cursor position
                --             e.g. auto-import, fix error, extract variable
                map('<leader>ca', '<cmd>Lspsaga code_action<cr>', 'Code Action')

                -- <leader>rn: Rename the symbol under cursor across the whole project
                --             All references will be updated automatically
                map('<leader>rn', '<cmd>Lspsaga rename<cr>', 'Rename Symbol')

                -- <leader>pd: Preview the definition in a floating popup
                --             without jumping away from your current position
                map('<leader>pd', '<cmd>Lspsaga peek_definition<cr>', 'Peek Definition')

                -- <leader>ol: Toggle a sidebar outline of all symbols in the file
                --             Great for navigating large files quickly
                map('<leader>ol', '<cmd>Lspsaga outline<cr>', 'Toggle Outline')

                -- ---------------------------------------------------------
                -- DIAGNOSTICS (errors, warnings, hints)
                -- ---------------------------------------------------------

                -- <leader>e: Open a floating window showing the full diagnostic
                --            message for the error/warning under cursor
                map('<leader>e', vim.diagnostic.open_float, 'Show Diagnostics')

                -- [d: Jump to the previous diagnostic (error/warning) in the file
                map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')

                -- ]d: Jump to the next diagnostic (error/warning) in the file
                map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')

                -- <leader>q: Send all diagnostics to the location list
                --            so you can navigate them like a list (:lopen)
                map('<leader>q', vim.diagnostic.setloclist, 'Diagnostics List')

                -- ---------------------------------------------------------
                -- FORMATTING
                -- ---------------------------------------------------------

                -- <leader>f: Manually trigger formatting for the current file
                --            Uses conform.nvim, falls back to LSP if no formatter found
                --            Note: files also auto-format on save via conform.nvim above
                map('<leader>f', function()
                    require('conform').format({ async = true, lsp_fallback = true })
                end, 'Format File')
            end

            -- Diagnostic display config (uses new API instead of deprecated sign_define)
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = "󰠠 ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    }
                },
                virtual_text = true,      -- show inline error messages next to code
                underline = true,         -- underline the problematic code
                update_in_insert = false, -- don't show errors while typing, only on leaving insert
                severity_sort = true,     -- show errors before warnings
                float = {
                    border = "rounded",
                    source = "always",    -- show which LSP reported the error in the popup
                },
            })

            -- Shared capabilities (tells LSP what features the editor supports)
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            -- Server configs (uses new vim.lsp.config API instead of deprecated lspconfig.xxx.setup)
            vim.lsp.config('pyright', {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",    -- basic | strict | off
                            autoSearchPaths = true,        -- auto find site-packages etc.
                            useLibraryCodeForTypes = true, -- infer types from installed libs
                        }
                    }
                }
            })

            vim.lsp.config('gopls', {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = { unusedparams = true }, -- warn on unused function params
                        staticcheck = true,                 -- extra static analysis checks
                        gofumpt = true,                     -- use gofumpt formatting rules
                    }
                }
            })

            vim.lsp.config('ts_ls', {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config('jdtls', {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Enable all configured servers
            vim.lsp.enable({ 'pyright', 'gopls', 'ts_ls', 'jdtls' })
        end
    },
}