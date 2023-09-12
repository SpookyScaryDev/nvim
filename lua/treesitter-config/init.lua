require 'nvim-treesitter.install'.compilers = { "clang" }
local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = {},
ignore_install = {"rnoweb"},
highlight = { -- enable highlighting
  enable = true, 
    disable = { "html" },
},
indent = {
  enable = true, -- default is disabled anyways
}
}
