let g:study_app_path = '/c/home/user/docs/code/projects/review/study_app.py'

nnoremap <buffer> <cr> :call Run('python'  study_app_path, '%', '')<cr>
