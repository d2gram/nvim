return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = { },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
    },
    config = function()
        require("noice").setup({
            lsp = {
                signature = {
                    enabled = false,
                    auto_open = { enabled = false },
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                long_message_to_split = true,
            },
            notify = {
                enabled = true,
                view = "notify",
                timeout = 5000
            }
        })

        require("notify").setup({
            stages = "slide",
            timeout = 5000,
            render = "default",
            top_down = false,
        })
    end,
}
