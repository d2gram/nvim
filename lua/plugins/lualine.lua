return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            options = {
                theme = "powerline_dark"
            },
            tabline = nil,
            -- winbar = {
            --     lualine_c = {
            --         function()
            --             return navic.get_location()
            --         end,
            --         cond = function()
            --             return navic.is_available()
            --         end,
            --     },
            -- },
            -- sections = {
            --     lualine_c = {
            --         {
            --             "navic",
            --             color_correction = "dynamic",
            --             navic_options = nil,
            --         },
            --     },
            -- },
        })
    end,
}
