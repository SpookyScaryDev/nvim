" With this function you can reuse the same terminal in neovim.
" You can toggle the terminal and also send a command to the same terminal.

let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1

function! MonkeyTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    new 
    "set winhighlight=Normal:TermNormal
    "setlocal signcolumn=no
    " Moves to the window the right the current one
    if &columns < 200
        wincmd J
        resize 25
    else 
        wincmd L
        vertical resize 70
    endif

    set nonumber

    " let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })
    terminal

     " Change the name of the buffer to "Terminal 1"
     silent file Terminal\ 1
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
     let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:monkey_terminal_window)
    sp
    " Moves to the window below the current one
    if &columns < 200
        wincmd J
        resize 25
    else 
        wincmd L
        vertical resize 80
    endif
    "buffer Terminal\ 1
    " echom s:monkey_terminal_buffer
    " buffer s:monkey_terminal_buffer
    execute 'buffer ' . s:monkey_terminal_buffer
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
    endif
  endif
endfunction

function! MonkeyTerminalToggle()
  if win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalClose()
  else
    call MonkeyTerminalOpen()
  endif
endfunction

function! MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    " close the current window
    hide
    endif
endfunction

function! MonkeyTerminalExec(cmd)
  if !win_gotoid(s:monkey_terminal_window)
    call MonkeyTerminalOpen()
  endif

  " clear current input
  " call jobsend(s:monkey_terminal_job_id, "clear\n")

  silent! bp
  silent! bd #
  execute 'silent! terminal ' . a:cmd 

  set nobuflisted

  let s:monkey_terminal_window = win_getid()
  let s:monkey_terminal_buffer = bufnr('%')

  " run cmd
  " call jobsend(s:monkey_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction

" With this maps you can now toggle the terminal
nnoremap <F7> :call MonkeyTerminalToggle()<cr>
tnoremap <F7> <C-\><C-n>:call MonkeyTerminalToggle()<cr>

" This an example on how specify command with different types of files.
"    augroup go
"        autocmd!
"        autocmd BufRead,BufNewFile *.go set filetype=go
"        autocmd FileType go nnoremap <F5> :call MonkeyTerminalExec('go run ' . expand('%'))<cr>
"    augroup END

