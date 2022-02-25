" Paths
let g:todopath = '/c/home/user/docs/quests'

" cd quickly to directories or files
cnoremap con<cr>	cd		/c/home/user/.config/<cr>:e <c-d>
cnoremap code<cr>	cd		/c/home/user/docs/code/<cr>:e <c-d>
cnoremap etc<cr>	cd		/c/apps/scoop/apps/git/current/etc/<cr>:e <c-d>
cnoremap tod<cr> 	tabe<cr>:cd		/c/home/user/docs/quests<cr>:e <c-d>
cnoremap rev<cr>	cd		/c/home/user/docs/code/projects/review/questions<cr>:e <c-d>
cnoremap so<cr>		silent! w<cr>:source	/c/home/user/.config/vim/vimfiles/_vimrc<cr>:set filetype<cr>
cnoremap vi<cr> 	cd		/c/home/user/.config/vim/vimfiles<cr>:e <c-d>

" Quick fix navigation
nnoremap <c-j> :cn<cr>zz
nnoremap <c-k> :cp<cr>zz

" Copy directory or path
command! CopyFileDir  execute 'let @*="' . expand('%:p:h') . '"'
command! CopyFilePath execute 'let @*="' . expand('%:p')   . '"'

" Convert filepaths between unix and windows
command! ConvertPath call ConvertPath()
function ConvertPath()
    normal mz0
    if search('/', '', line('.'))
        silent! s;/c/;C:\
        s;/;\
    elseif search('\\', '', line('.'))
        silent! s;C:\\;/c/
        s;\\;/
    else
        echo 'Not a filepath'
    endif
    normal `z
endfunction
