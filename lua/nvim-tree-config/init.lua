local options = {
   filters = {
      dotfiles = false,
      exclude = { "custom" },
   },
   disable_netrw = true,
   hijack_netrw = true,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 40,
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
      highlight_opened_files = '0',
      highlight_git = true,
      add_trailing = false,
      indent_markers = {
         enable = false,
      },
   },
}

require'nvim-tree'.setup(options)

local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  if no_name then return end 

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "SessionLoadPost" }, { callback = open_nvim_tree })

vim.api.nvim_exec(
[[
    highlight NvimTreeNormal guibg=#1d2021
    highlight NvimTreeVertSplit guifg=#1d2021 guibg=#1d2021

]], false)
