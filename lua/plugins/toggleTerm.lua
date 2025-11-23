return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require("toggleterm").setup({
      shell = "/usr/bin/zsh",
    })
  end
}
