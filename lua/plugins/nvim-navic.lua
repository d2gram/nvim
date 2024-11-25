return {
    'SmiteshP/nvim-navic',
    dependencies = "neovim/nvim-lspconfig",
    config = function()
        require('nvim-navic').setup({
            highlight = false,
            click = true,
        })
    end,
}
