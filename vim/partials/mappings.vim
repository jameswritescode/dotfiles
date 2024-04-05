let g:yank_copy_command = trim(system('uname -a')) =~# 'microsoft' ? 'clip.exe' : 'pbcopy'

vnoremap <expr> <c-c> 'y:call system("' . g:yank_copy_command . '", getreg("\""))<cr>'

""""""""""""""""""""""""""""""
" which-key related mappings "
""""""""""""""""""""""""""""""

let g:which_key_map = {}
let g:which_key_visual_map = {}

let g:which_key_map.a = { 'name': '+ai' }
let g:which_key_map.b = { 'name': '+buffer' }
let g:which_key_map.d = { 'name': '+dap' }
let g:which_key_map.f = { 'name': '+fzf' }
let g:which_key_map.t = { 'name': '+terminal/toggle' }

" +git
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_visual_map.g = { 'name': g:which_key_map.g.name }

" +lsp
let g:which_key_map.l = { 'name': '+lsp' }
let g:which_key_map.l.a = 'code-action'
let g:which_key_map.l.f = 'format'
let g:which_key_map.l.r = 'rename'

" +diagnostic
let g:which_key_map.l.d = { 'name': '+diagnostic' }
let g:which_key_map.l.g = { 'name': '+goto' }
let g:which_key_map.l.g.d = 'definition'
let g:which_key_map.l.g.i = 'implementation'
let g:which_key_map.l.g.r = 'references'
let g:which_key_map.l.g.y = 'type-definition'

" let g:which_key_map.r = { 'name': 'rest' }
" let g:which_key_map.r.r = 'run'
" nnoremap <silent><leader>rr <Plug>RestNvim<cr>
