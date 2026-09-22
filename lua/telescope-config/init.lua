require("telescope").load_extension("project")
require('telescope').load_extension('sessions_picker')

require('telescope').setup({
    defaults = {
        preview = false,
		layout_config = {
    		horizontal = { width = 100 }
    	},
        results_title = false,
        prompt_title = false,
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous"
            }
        },
        dynamic_preview_title = false,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          --'--glob=!**/node_modules/*',
          '--ignore-file', '.gitignore'
        }
    };
})

vim.api.nvim_exec(
[[
    highlight TelescopeResultsBorder guifg=#83a598
    highlight TelescopePromptBorder guifg=#83a598
    highlight TelescopeBorder guifg=#83a598
]], false)

    --highlight TelescopeNormal guibg=#1b1b1b
