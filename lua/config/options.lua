local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.cursorline = true

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"

opt.encoding = "UTF-8"
opt.cmdheight = 0
opt.scrolloff = 10
opt.mouse:append("a")

opt.list = true
opt.listchars:append("space:·")
opt.listchars:append("trail:·")
opt.fillchars = { eob = ' ' }

opt.conceallevel = 2

opt.showtabline = 2

opt.fileformat = "unix"


