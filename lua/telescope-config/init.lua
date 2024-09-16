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
        dynamic_preview_title = false,
    };
})

vim.api.nvim_exec(
[[
    highlight TelescopeResultsBorder guifg=#83a598
    highlight TelescopePromptBorder guifg=#83a598
    highlight TelescopeBorder guifg=#83a598
]], false)

    --highlight TelescopeNormal guibg=#1b1b1b
