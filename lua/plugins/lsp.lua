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

      lspconfig.ts_ls.setup({ })
      lspconfig.clangd.setup({ 
        cmd = {
          "clangd",
          "--fallback-style={BasedOnStyle: 'LLVM', AccessModifierOffset: -2}",
        },
      })
      lspconfig.pyright.setup({ })
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
      })

      -- keyMapper('K', function()
      --     require('lsp_signature').toggle_float_win()
      -- end)
      keyMapper('<leader>d', vim.lsp.buf.definition)
      keyMapper('<leader>ca', vim.lsp.buf.code_action)
    end
  }
}
