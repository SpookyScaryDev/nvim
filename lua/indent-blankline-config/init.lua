local g = vim.g

require('ibl').setup {
    indent = { char = "┆" }
}
g.indent_blankline_char = "┆"

vim.api.nvim_exec(
[[
    highlight IndentBlankLineChar guifg=#504945
]], false)
