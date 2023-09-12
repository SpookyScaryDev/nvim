set runtimepath+=~/.vim/bundle/lightline.vim         " Plugins
set runtimepath+=~/.vim/bundle/auto-pairs
"set runtimepath+=~/.vim/bundle/vim-indent-guides
set runtimepath+=~/.vim/bundle/nerdtree
set runtimepath+=~/.vim/bundle/vim-devicons
set runtimepath+=~/.vim/bundle/gruvbox
"set runtimepath+=~/.vim/bundle/vim-startify
set runtimepath+=~/.vim/bundle/ctrlp.vim

runtime ./monkeyterm.vim

source ~/.vim/bundle/indentLine/after/plugin/indentLine.vim
"source ~/.vim/bundle/vim-startify/plugin/startify.vim

source ~/.vim/autoload/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'akinsho/nvim-bufferline.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'

"Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
"Plug 'frankier/neovim-colors-solarized-truecolor-only'
"Plug 'dracula/vim'

"Plug 'feline-nvim/feline.nvim'
Plug 'kyazdani42/nvim-tree.lua'


call plug#end()
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

let g:OmniSharp_server_stdio = 1

set completeopt=menuone,noinsert,noselect,preview
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_force_refresh_on_context_changed = 1

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

" if using ultisnips, set g:OmniSharp_want_snippet to 1
let g:OmniSharp_want_snippet = 0
let g:ale_sign_column_always = 1
highlight SignColor guibg=FFFFFF
highlight ALESignColumnWithErrors guibg=FFFFFF
highlight ALESignColumnWithoutErrors guibg=FFFFFF

"cpp enhanced highlighting
"let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:ctrlp_custom_ignore = '\v\.(git|vcxproj|user)$'
let g:ctrlp_by_filename = 1

autocmd FileType c,cpp syntax clear cStructure
autocmd FileType c,cpp syntax clear cppStructure
autocmd FileType c,cpp syntax keyword cppStructure namespace
autocmd FileType c,cpp syntax match cCustomClassKey "\<struct\>"
autocmd FileType c,cpp syntax match cCustomClassKey "\<using\>"
autocmd FileType c,cpp syntax match cCustomClassKey "\<typedef\>"
autocmd FileType c,cpp syntax match cCustomClassName "\<struct\_s\+\w\+\>" contains=cCustomClassKey
autocmd FileType c,cpp syntax match cCustomClassName "\<using\_s\+\w\+\>" contains=cCustomClassKey
autocmd FileType c,cpp syntax match cCustomClassName "\<typedef\_s\+\w\+\>" contains=cCustomClassKey

autocmd FileType c,cpp highlight cType guifg=SteelBlue1
autocmd FileType c,cpp highlight cppStructure guifg=SteelBlue1
autocmd FileType c,cpp highlight cppAccess guifg=SteelBlue1
autocmd FileType c,cpp highlight cStatement guifg=SteelBlue1
autocmd FileType c,cpp highlight cppStatement guifg=SteelBlue1
autocmd FileType c,cpp highlight cLabel guifg=SteelBlue1
autocmd FileType c,cpp highlight cConditional guifg=SteelBlue1
autocmd FileType c,cpp highlight cRepeat guifg=SteelBlue1
autocmd FileType c,cpp highlight Function guifg=chocolate1
autocmd FileType c,cpp highlight cCustomClassName guifg=aquamarine1
autocmd FileType c,cpp highlight cppCustomClassName guifg=aquamarine1

colorscheme gruvbox

set encoding=utf-8                                   " Lightline

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
set showtabline=2
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#enable_nerdfont=1

" set lines=54 columns=206

" vim-indent-guides
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray24
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray34

"let g:indent_guides_start_level = 1
"let g:indent_guides_guide_size = 1

"let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_first_char = '┆'
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0
let g:indentLine_showFirstIndentLevel = 1

" NERDTree
let g:NERDTreeWinSize=35
map <C-f> :NERDTreeToggle<CR>
" let NERDTreeMapToggleFilters='<C-f>'

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | cd D:\Users\Thomas\Documents\dev | endif

" Open NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Remove GUI stuff
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set lines=53
set columns=213

let g:startify_left_padding = 20
let g:startify_center=80

" 'Most Recent Files' number
let g:startify_files_number           = 18

let g:startify_custom_header = "" 
"         \ 'startify#center(startify#fortune#cowsay())'

" Simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   Recent files'] },
  \ ]

let g:startify_bookmarks = [
  \ 'C:\Users\Thomas\AppData\Local\nvim\init.vim'
  \ ]

let g:startify_center=80
let g:startify_left_padding = 20

"autocmd BufReadPre,FileReadPre * simalt ~x
autocmd BufReadPre,FileReadPre * let g:indentLine_enabled = 1

" Add line numbers
set number


" Unbind arrowkeys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Page up and page down.
map gj <C-F>
map gk <C-B>

" Full colour!
set termguicolors

" Highlight current line
set cursorline

" Highlight split divide
"highlight VertSplit guibg=#3c3836 guifg=#3c3836
highlight VertSplit guifg=#3c3836

" Hide ~
highlight EndOfBuffer guibg=gray15 guifg=gray15

" Make going to normal easier
imap ii <Esc>

" Refresh
map <F5> :source $MYVIMRC<CR>

" Switch between files with F2 and F3
map <F2> :bprev<CR>
map <F3> :bnext<CR>

" Switch tab
map <Tab> :bnext <CR>

" Split page vertically
"map s :vsplit<CR>

" Makes moving between splits easier
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>

filetype indent on      " load filetype-specific indent files
set wildcharm=<Tab>
set wildmenu
set wildmode=full
set showmatch           " highlight matching [{()}]

set foldenable          " enable folding
set foldmethod=syntax   " Fold by syntax
set foldlevelstart=99   " Unfold all
nnoremap <space> za     " space open/closes folds

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase      
set smartcase           " Case sensitive if you use caps

set autoindent          " Indent in brackets
set smartindent

set tabstop=4           " Set tab to 4 spaces
set shiftwidth=4
set expandtab           " Tab becomes 4 spaces

set noequalalways       " keep buffer sizes 


" Bind F5 to save file if modified and execute python script in a buffer.
map <F7> :call ExecutePython()<CR>
map <F8> :call BuildCpp()<CR>
map <C-Enter> :call BuildCSharp()<CR>
map <C-t> :call MonkeyTerminalToggle()<CR>;

"set termwinsize=15x0

function! ExecutePython()
    silent execute "!python %"
endfunction

function! BuildCpp()
    " silent execute "wa"
    " set wrap
    " "silent execute "& "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\msbuild.exe""
    " "silent execute 'term "& "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\msbuild.exe"'
    " execute "botright 80vsplit"
    " execute "normal \<C-W>\<C-L>"

    " execute" silent keepalt file C++Output

    " "execute "terminal 'C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe'"
    " execute 'terminal "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe'
    " call MonkeyTerminalOpen()
    " call MonkeyTerminalExec('echo hello!')
    call MonkeyTerminalExec('"C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe')
    " execute "normal \<S-G>"
    " execute "normal \<C-W>\<C-H>"
    " set nowrap
endfunction

function! BuildCSharp()
    "call MonkeyTerminalExec('"C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe')
    "call MonkeyTerminalExec('dotnet run')
    call MonkeyTerminalExec('dotnet build')
endfunction

set clipboard+=unnamedplus  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard

set fillchars=vert:│,fold:┈,diff:┈
"au GUIEnter * simalt ~x

set norelativenumber

set nowrap

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

