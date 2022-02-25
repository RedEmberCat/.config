command! CodeCademy call CodeCademy()
function! CodeCademy()
    nunmap <buffer> <cr>
    nunmap <buffer> <c-cr>
    nnoremap <cr> mzgg"*yG`z:call system('python /c/home/user/.config/vim/vimfiles/python-scripts/codecademy_interface.py to')<cr>
    nnoremap <c-cr> :call system('python /c/home/user/.config/vim/vimfiles/python-scripts/codecademy_interface.py from')<cr>
endfunction
