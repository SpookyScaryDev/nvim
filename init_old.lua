local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like:
    use 'ellisonleao/gruvbox.nvim'
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
}
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
use 'feline-nvim/feline.nvim'
use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

  end
)


vim.opt.termguicolors = true
require("bufferline").setup{}

require('feline')

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0

g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
   folder_arrows = 1,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
      arrow_open = "",
      arrow_closed = "",
   },
}

local options = {
   filters = {
      dotfiles = false,
      exclude = { "custom" },
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = false,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 30,
      hide_root_folder = true,
   },
   git = {
      enable = false,
      ignore = true,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
   renderer = {
      indent_markers = {
         enable = false,
      },
   },
}

require'nvim-tree'.setup(options)

vim.api.nvim_set_keymap( 'n', '<C-f>', ':NvimTreeToggle<CR>', {})

vim.api.nvim_exec(
[[
  highlight NonText guifg=bg
  highlight NvimTreeNormal guibg=#1d2021
highlight NvimTreeVertSplit guifg=#1d2021 guibg=#1d2021
]], false)

vim.cmd [[
 function! Toggle_theme(a,b,c,d)
   lua require('base46').toggle_theme()
 endfunction
 function! Quit_vim(a,b,c,d)
     qa
 endfunction
]]

local options = {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = false,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
      themable = true,

      custom_areas = {
         right = function()
            return {
               { text = "%@Toggle_theme@" .. vim.g.toggle_theme_icon .. "%X" },
               { text = "%@Quit_vim@ %X" },
            }
         end,
      },

      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            end
            return true
         end

         return true
      end,
   },
}


require("bufferline").setup(options)