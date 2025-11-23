vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.deprecate = function() end

vim.g.clipboard = {
  name = 'termux',
  copy = {
    ['+'] = 'termux-clipboard-set',
    ['*'] = 'termux-clipboard-set',
  },
  paste = {
    ['+'] = 'termux-clipboard-get',
    ['*'] = 'termux-clipboard-get',
  },
  cache_enabled = 1,
}



