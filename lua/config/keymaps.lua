local mapKey = require("utils.keyMapper").mapKey


-------- NAVIGATION --------
-- logical HJKL navigation
mapKey('j', 'gj')
mapKey('k', 'gk')
mapKey('H', '^', 'n', { noremap = false })
mapKey('L', '$', 'n', { noremap = false })

-- pane
mapKey('<C-h>', '<C-w>h')
mapKey('<C-j>', '<C-w>j')
mapKey('<C-k>', '<C-w>k')
mapKey('<C-l>', '<C-w>l')

-- see warning description
mapKey('<C-i>', [[:lua vim.diagnostic.open_float()<CR>]])

-------- LEADER KEYMAPPING --------
--    .. ..      .    .  . . 
-- abcdefghijklmnopqrstuvwxyz
--         .   . .  . .      
-- ABCDEFGHIJKLMNOPQRSTUVWXYZ

-- 여기에 정의되지 않은 leader 키맵
-- d: (lsp) 정의로 점프
-- g: (lazygit) open lazygit
-- o: (telescope) open 'recent' float window

-- Neotree
mapKey('<leader>e', ':Neotree toggle<cr>')

-- claer search highlight
mapKey('<leader>h', ':nohlsearch<CR>')

-- open terminal in... t(horizontal), y(vertical) way.
mapKey('<leader>t', [[:ToggleTerm direction=horizontal size=15<CR>]])
mapKey('<leader>y', [[:ToggleTerm direction=vertical size=60<CR>]])

-- open recent file
mapKey('<leader>O', [[:lua require('persistence').load({last = true}) <CR>]])

-- toggle line wrapping mode (soft <-> hard)
mapKey('<leader>w', [[:ToggleWrapMode<CR>:nohlsearch<CR>]])


-- Clear all inappropriate carriage return
mapKey('<leader>M', [[:%s/\r//g<CR>]])
-- Clear all inappropriate indent
mapKey('<leader>I', 'gg=G')
-- Clear all trailing space
mapKey('<leader>T', [[:%s/\s\+$//e<CR>:nohlsearch<CR>]])
-- Reload neovim configuration
mapKey('<leader>R', [[:luafile ~/.config/nvim/init.lua<CR>]])


-- dismiss noice popup
mapKey('<leader>[', function()
    require('notify').dismiss({ silent = true, enter = false, })
end)

------------ ALT -------------
-- 여기에 정의되지 않은 ALT 키맵
-- Alt + f: (fzf) find-files
-- Alt + g: (fzf) live-grep

-- Newline while not enter the insert mode
mapKey('<A-o>', 'o<ESC>')
mapKey('<A-O>', 'O<Esc>')

-- Tab operation
mapKey('<A-a>', [[:BufferPrevious<CR>]])
mapKey('<A-d>', [[:BufferNext<CR>]])
mapKey('<A-S-a>', [[:BufferMovePrevious<CR>]])
mapKey('<A-S-d>', [[:BufferMoveNext<CR>]])

mapKey('<A-X>', [[:BufferCloseAllButCurrentOrPinned<CR>]])
mapKey('<A-x>', [[:BufferClose<CR>]])
mapKey('<A-p>', [[:BufferPin<CR>]])

-- File modification
mapKey('<A-w>', [[:w<CR>]])
mapKey('<A-q>', [[:q<CR>]])

-- Pane spliting
mapKey('<A-s>', [[:vsplit<CR>]])
mapKey('<A-S>', '<C-w>x') -- exchanging panes




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
