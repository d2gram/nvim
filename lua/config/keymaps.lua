local mapKey = require("utils.keyMapper").mapKey


-------- NAVIGATION --------
-- logical HJKL navigation
mapKey('j', 'gj')
mapKey('k', 'gk')

-- pane
mapKey('<C-h>', '<C-w>h')
mapKey('<C-j>', '<C-w>j')
mapKey('<C-k>', '<C-w>k')
mapKey('<C-l>', '<C-w>l')



-------- LEADER KEYMAPPING --------
-- Neotree
mapKey('<leader>e', ':Neotree toggle<cr>')

-- claer search highlight
mapKey('<leader>h', ':nohlsearch<CR>')

-- terminal
local toggleTerminal = require("utils.toggleTerminal")
mapKey('<leader>t',[[:lua require("utils.toggleTerminal").ToggleTerminal()<CR>]])

-- delete all buffer except Neotree
-- local closeAll = require("utils.closeAll")
-- mapKey('<leader>bd', [[:lua require("utils.closeAll").closeAll()<CR>]])

-- DEPRECATED because of using barbar.nvim


-- toggle line wrapping mode (soft <-> hard)
mapKey('<leader>w', [[:ToggleWrapMode<CR>:nohlsearch<CR>]])

-- Clear all inappropriate carriage return
mapKey('<leader>M', [[:%s/\r//g<CR>]])
-- Clear all inappropriate indent
mapKey('<leader>I', 'ggVG=')
-- Clear all trailing space
mapKey('<leader>T', [[:%s/\s\+$//e<CR>:nohlsearch<CR>]])

------------ ALT -------------
-- Newline while not enter the insert mode
mapKey('<A-o>', 'o<ESC>')
mapKey('<A-O>', 'O<Esc>')

-- Row exchange
mapKey('<A-j>', [[:m .+1<CR>==]])
mapKey('<A-k>', [[:m .-2<CR>==]])

-- Tab operation
mapKey('<A-,>', [[:BufferPrevious<CR>]])
mapKey('<A-.>', [[:BufferNext<CR>]])
mapKey('<A-<>', [[:BufferMovePrevious<CR>]])
mapKey('<A->>', [[:BufferMoveNext<CR>]])
-- mapKey('<A-h>', [[:BufferPrevious<CR>]])
-- mapKey('<A-l>', [[:BufferNext<CR>]])
-- mapKey('<A-H>', [[:BufferMovePrevious<CR>]])
-- mapKey('<A-L>', [[:BufferMoveNext<CR>]])

mapKey('<A-D>', [[:BufferCloseAllButCurrentOrPinned<CR>]])
mapKey('<A-d>', [[:BufferClose<CR>]])
mapKey('<A-p>', [[:BufferPin<CR>]])

-- File modification
mapKey('<A-w>', [[:w<CR>]])
mapKey('<A-q>', [[:q<CR>]])

-- Pane spliting
mapKey('<A-s>', [[:vsplit<CR>]])
mapKey('<A-S>', '<C-w>x') -- exchanging panes

-- Telescope.nvim (Search)
-- mapKey('<A-f>', [[:Telescope find_files<CR>]])
-- mapKey('<A-g>', [[:Telescope live_grep<CR>]])


-------- INSERT MODE --------
-- Newline on insert mode
mapKey('<A-o>', '<Esc>o', 'i')
mapKey('<A-O>', '<Esc>O', 'i')

-- HJKL navigation on insert mode
mapKey('<C-h>', '<Left>', 'i')
mapKey('<C-j>', '<Down>', 'i')
mapKey('<C-k>', '<Up>', 'i')
mapKey('<C-l>', '<Right>', 'i')



-------- TERMINAL MODE --------
-- get out from terminal mode 
mapKey('<C-q>', [[<C-\><C-n>]], 't')
mapKey('<Esc>', [[<C-\><C-n>]], 't')
