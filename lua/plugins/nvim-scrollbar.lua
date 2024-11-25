return {
    "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup({
            show = true,
            handle = {
                hide_if_all_visible = false,
                color = nil,
                color_nr = nil,
                highlight = "CursorColumn",
            },
            excluded_filetypes = {
                "neo-tree",
                "neo-tree-popup",
                "TelescopePrompt",
            }

        })
    end,
}
