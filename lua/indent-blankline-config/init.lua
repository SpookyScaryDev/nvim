local g = vim.g

require('indent_blankline').setup()
g.indent_blankline_char = "┆"


vim.api.nvim_exec(
[[
    highlight IndentBlankLineChar guifg=#504945
]], false)
