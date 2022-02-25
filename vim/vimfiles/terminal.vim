set termwinkey=<c-e>
cnoremap ter<cr> vert ter<cr>

augroup terminalcommands
	autocmd!

    autocmd Filetype bqn	let g:prefix = 'bqn'
    autocmd Filetype forth	let g:prefix = 'gforth'
    autocmd Filetype python	let g:prefix = 'python'
    autocmd Filetype sh 	let g:prefix = 'bash'
    autocmd Filetype v		let g:prefix = 'v run'
    autocmd Filetype vim	let g:prefix = 'source'
    autocmd Filetype zig	let g:prefix = 'zig run'

    autocmd Filetype bqn,forth,python,sh,v,zig let g:body = '%'
    autocmd Filetype vim	let g:body = '/c/home/user/.config/vim/vimfiles/_vimrc'

	" Close terminals
	nnoremap <s-cr> :call CloseTerminals()<cr>
	tnoremap <s-cr> <c-e>:call CloseTerminals()<cr>

	" Run FILE
	autocmd Filetype python,sh nnoremap <buffer> <cr> :w<cr>:call Run(g:prefix, g:body, '')<cr>
	autocmd Filetype vim nnoremap <buffer> <cr> :w<cr>:execute g:prefix g:body<cr>

    " Run test_FILE
    autocmd Filetype python nnoremap <buffer> <c-cr> :call Run(g:prefix, 'run_tests.py', '')<cr>
	"autocmd Filetype python nnoremap <buffer> <c-cr> :w<cr>:call Run('test_', '%', '')<cr>
    "autocmd Filetype python nnoremap <buffer> <c-cr> :call RunTests()<cr>

augroup END

command! AddTests call AddTests()

function! Run(prefix, file, suffix)
    w
	normal mz
	call CloseTerminals()
    execute 'vert ter' a:prefix a:file a:suffix
    wincmd p
    normal `z
endfunction

function! CloseTerminals()
	let terminals = split(execute('filter/!/ls'), '\n')
	if !len(terminals)
		return
	else
		for i in range(len(terminals))
			silent! execute "bd!" split(terminals[i], ' ')[0]
		endfor
	endif
endfunction

function! AddTests()
    e run_tests.py
    normal gg}Ofrom # import *
    normal }}Ofrom tests import test_#
    normal "zyiwGoz.tests(globals())
    e #
endfunction

"function! RunTests()
"    let file = expand('%')
"    let test_file = 'tests/test_' . file
"    let tmp_test_file = 'tests/test_temp'
"    let command = join(['cat', file, test_file, '>', tmp_test_file], ' ')
"    call system(command)
"    call Run('', tmp_test_file, '')
"endfunction


