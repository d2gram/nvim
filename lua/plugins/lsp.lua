local keyMapper = require('utils.keyMapper').mapKey
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "clangd",
                    "omnisharp",
                    "pyright",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
                -- on_attach = function(client, bufnr)
                --     navic.attach(client, bufnr)
                -- end,
                -- on_attach = function(client, bufnr)
                --     -- `nvim-navic`을 LSP에 연결
                --     if client.server_capabilities.documentSymbolProvider then
                --         require('nvim-navic').attach(client, bufnr)
                --     end
                -- end,
            })
            lspconfig.ts_ls.setup({
                -- on_attach = function(client, bufnr)
                --     navic.attach(client, bufnr)
                -- end,
                -- on_attach = function(client, bufnr)
                --     -- `nvim-navic`을 LSP에 연결
                --     if client.server_capabilities.documentSymbolProvider then
                --         require('nvim-navic').attach(client, bufnr)
                --     end
                -- end,
            })
            lspconfig.clangd.setup({
                -- on_attach = function(client, bufnr)
                --     navic.attach(client, bufnr)
                -- end,
                -- on_attach = function(client, bufnr)
                --     -- `nvim-navic`을 LSP에 연결
                --     if client.server_capabilities.documentSymbolProvider then
                --         require('nvim-navic').attach(client, bufnr)
                --     end
                -- end,
            })
            lspconfig.omnisharp.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = true
                end,
                settings = {
                    formattingOptions = {
                        Bracestyle = "Allman",
                    }
                }
            })
            lspconfig.pyright.setup({
                -- on_attach = function(client, bufnr)
                --     navic.attach(client, bufnr)
                -- end,
                -- on_attach = function(client, bufnr)
                --     -- `nvim-navic`을 LSP에 연결
                --     if client.server_capabilities.documentSymbolProvider then
                --         require('nvim-navic').attach(client, bufnr)
                --     end
                -- end,
            })

            keyMapper('K', vim.lsp.buf.hover)
            keyMapper('gd', vim.lsp.buf.definition)
            keyMapper('<leader>ca', vim.lsp.buf.code_action)
        end
    }
}
