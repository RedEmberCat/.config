" Open file under cursor, even if it doesn't exist
nnoremap gf :e <cfile><cr>

" Keep search match in mid window
nnoremap n nzz
nnoremap N Nzz

" Rerun last macro (Q enters Ex mode, which I don't use.)
nnoremap Q @@

" Add jk/kj movements larger than 1 to jump list.
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'

" Sets and clears search highlighting
nnoremap <bs>   :set hlsearch!<cr>
nnoremap *      :set hlsearch<cr>*
nnoremap /      :set hlsearch<cr>/
nnoremap ?      :set hlsearch<cr>?

" Make Y act like C and D, which I prefer.
" Reason for inconsitency: https://vi.stackexchange.com/a/6135
nnoremap Y y$

" Switch delimiters
nnoremap <leader>( mz%%r)r(`z
nnoremap <leader>[ mz%%r]r[`z
nnoremap <leader>{ mz%%r}r{`z
nnoremap <leader>' :call SwitchQuotes()<cr>
nnoremap <leader>" :call SwitchQuotes()<cr>
function! SwitchQuotes()
    normal mz
    if search('"', '', line('.')) ? 0 : 1
        silent! normal! f'r",r"
    else
        " The next two lines doesn't work on one line for some reason
        silent! normal! f"
        silent! normal! r',r'
    endif
    normal `z
endfunction

" Remove function f(x, y) -> x
nnoremap <leader>f f("_db"_xmzf,"_df)`z
nnoremap <leader>F %mx%"_db"_xmz`x"_x`z

" Copy buffer
nnoremap yi% mzgg"*yG`z

" Replace buffer with clipboard
nnoremap di% gg"_dG"*PG

" Create new undo entry on newline
inoremap <cr> <cr><c-g>u

" Datetime
"   command     Human-readable
"   commandd    Dense version

" Datetime
noremap! <expr> dt; strftime('%Y-%m-%d %H:%M')
noremap! <expr> dtd; strftime('%Y%m%d%H%M')

" Date
noremap! <expr> da; strftime('%Y-%m-%d')
noremap! <expr> dad; strftime('%Y%m%d')

" Time
noremap! <expr> ti; strftime('%H:%M')

" Datetime uuid approximate
noremap! <expr> id; strftime('%Y%m%d%H%M%S')

" Date display
command! Date echo system('date')

" Add TODO to -import
command! ToDo call ToDo()
function! ToDo()
    let file = '-to-do-important.txt'
    " Copy to do item from line: # TODO to do item
    normal! 0/TODOw"zy$
    " Open new tab to to do file
    execute 'tabe' g:todopath . '/' . file
    " Append to do item
    normal Goid;  z
    x
endfunction
