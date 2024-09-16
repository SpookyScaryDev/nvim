local set = vim.opt
local map = require("utils").map
local g = vim.g

-- vim.api.nvim_exec(
-- [[
--     cd C:\\Users\\TC_20\\Documents
--     runtime ./monkeyterm.vim
-- ]], false)

set.number = true
set.cursorline = true
set.wrap = false

set.autoindent = true
set.smartindent = true
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.clipboard ='unnamedplus'

set.laststatus = 3

set.signcolumn='yes'

set.showtabline=1

map( 'n', '<F1>', ':Alpha <CR>', { silent = true })

map("n", "<F5>", ":luafile $MYVIMRC <CR>", { silent = false })
map('n', '<C-f>', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<C-p>', ':Telescope find_files<CR>', { silent = true })

map('n', '<C-h>', '<C-w><C-h>', { silent = true })
map('n', '<C-j>', '<C-w><C-j>', { silent = true })
map('n', '<C-k>', '<C-w><C-k>', { silent = true })
map('n', '<C-l>', '<C-w><C-l>', { silent = true })

map('n', '<TAB>', ':bnext <CR>', { silent = true })
map('n', '<S-TAB>', ':bprev <CR>', { silent = true })

map('t', '<ESC>', '<C-\\><C-n>', { silent = true })
map('n', '<C-t>', ':call MonkeyTerminalToggle()<CR>', { silent = true })
map('t', '<C-t>', '<C-\\><C-n> <bar> :call MonkeyTerminalToggle()<CR>', { silent = false })

map('n', '<C-Enter>', ':call MonkeyTerminalExec(\'msbuild\')<CR>', { silent = false })

map('n', '<Enter>', 'o <Esc>', { silent=true})
map('n', '<S-Enter>', 'O <Esc>', { silent=true})

map('n', '<A-j>', ":m .+1<CR>gv=gv <ESC>", { silent=true})
map('n', '<A-k>', ":m .-2<CR>gv=gv <ESC>", { silent=true})

map('i', 'jj', '<ESC>', { silent=true })

vim.api.nvim_exec(
[[
    highlight NonText guifg=bg
    highlight EndOfBuffer guifg=bg
    highlight VertSplit guifg=#1b1b1b guibg=bg
    highlight StatusLine guifg = bg 
    highlight StatusLineNC guifg = bg 
    highlight TermNormal guibg=bg
]], false)
 
