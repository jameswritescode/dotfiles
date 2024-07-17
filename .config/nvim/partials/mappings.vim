let g:yank_copy_command = trim(system('uname -a')) =~# 'microsoft' ? 'clip.exe' : 'pbcopy'

vnoremap <expr> <c-c> 'y:call system("' . g:yank_copy_command . '", getreg("\""))<cr>'

" let g:which_key_map.r = { 'name': 'rest' }
" let g:which_key_map.r.r = 'run'
" nnoremap <silent><leader>rr <Plug>RestNvim<cr>
