local set = vim.opt
local map = require("utils").map
local g = vim.g

set.number = true
set.cursorline = true
set.wrap = true

set.autoindent = true
set.smartindent = true
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Use system clipboard
set.clipboard ='unnamedplus'

-- One statusline
set.laststatus = 3

set.signcolumn='yes'

set.showtabline=1

set.colorcolumn='120'

g.virtcolumn_char = "┆"

map('n', '<C-f>', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<C-p>', ':Telescope find_files<CR>', { silent = true })

map('n', '<C-h>', '<C-w><C-h>', { silent = true })
map('n', '<C-j>', '<C-w><C-j>', { silent = true })
map('n', '<C-k>', '<C-w><C-k>', { silent = true })
map('n', '<C-l>', '<C-w><C-l>', { silent = true })

-- Get rid of those ~s
vim.opt.fillchars:append('eob: ')

vim.api.nvim_exec(
[[
    highlight NonText guifg=bg
    highlight EndOfBuffer guifg=bg
    highlight VertSplit guifg=#1b1b1b guibg=bg
]], false)
