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
    highlight TelescopeNormal guibg=bg
    highlight TelescopeResultsBorder guifg=#83a598
    highlight TelescopePromptBorder guifg=#83a598
    highlight TelescopeBorder guifg=bg guibg=#83a598
]], false)
