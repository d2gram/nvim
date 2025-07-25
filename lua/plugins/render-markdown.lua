return{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        heading = {
            icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
            sign = false,
            -- position = 'inline',
            width = 'block',
            min_width = 50,
            left_pad = 0,
            right_pad = 10,
            -- border = true,
            -- border_virtual = true,
        },
        render_modes = true,
        bullet = {
            icons = { '', '', '', '' },
            icons = { '' },
        },
        checkbox = {
            unchecked = { icon = "" },
            checked = {
                icon = "",
                scope_highlight = "@markup.strikethrough",
            },
        },
        indent = {
            enabled = false,
            per_level = 2,
        }
    },
}
