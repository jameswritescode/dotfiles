inoremap jk <esc>

nnoremap <down>  <c-w>-
nnoremap <left>  1<c-w>>
nnoremap <right> 1<c-w><
nnoremap <up>    <c-w>+

nnoremap ;                :
nnoremap <silent><c-p>    <cmd>Telescope find_files previewer=false<cr>
nnoremap <silent><c-t>    <esc>:tabnew<cr>
nnoremap <silent><c-w>m   :wincmd _<bar>wincmd <bar><cr>
nnoremap <silent>\        <cmd>Telescope buffers<cr>
nnoremap gp               `[v`]
nnoremap j                gj
nnoremap k                gk

nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> H :call TabControl('tabp', 'bp')<cr>
nnoremap <silent> L :call TabControl('tabn', 'bn')<cr>

vnoremap J                 :m '>+1<cr>gv=gv
vnoremap K                 :m '<-2<cr>gv=gv

tnoremap <Esc> <c-\><c-n>

let g:yank_copy_command = trim(system('uname -a')) =~# 'microsoft' ? 'clip.exe' : 'pbcopy'

vnoremap <expr> <c-c> 'y:call system("' . g:yank_copy_command . '", getreg("\""))<cr>'

""""""""""""""""""""""""""""""""""
" which-key related mappings "
""""""""""""""""""""""""""""""""""

let g:which_key_map = {}
let g:which_key_visual_map = {}

let g:which_key_map.q = 'no-highlight'
nnoremap <silent><leader>q :noh<cr>

" +buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '-':     [':%bd|e#|bd#<cr>', 'delete-inactive-buffers'],
      \ }

" +dap
let g:which_key_map.d = { 'name': '+dap'}

let g:which_key_map.d.b = 'breakpoint-toggle'
nnoremap <silent><leader>db <cmd>lua require'dap'.toggle_breakpoint()<cr>

let g:which_key_map.d.c = 'continue'
nnoremap <silent><leader>dc <cmd>lua require'dap'.continue()<cr>

let g:which_key_map.d.d = 'disconnect'
nnoremap <silent><leader>dd <cmd>lua require'dap'.disconnect()<cr>

let g:which_key_map.d.r = 'repl-toggle'
nnoremap <silent><leader>dr <cmd>lua require'dap'.repl.toggle()<cr>

" +file/find
let g:which_key_map.f = { 'name': '+file/find' }

let g:which_key_map.f.g = 'telescope-live-grep'
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>

let g:which_key_map.f.w = 'telescope-grep-string'
nnoremap <silent><leader>fw <cmd>Telescope grep_string<cr>

let g:which_key_map.f.v = 'edit-vim'
nnoremap <silent><leader>fv :vsplit $DOTFILES/vim<cr>

let g:which_key_map.f.z = 'edit-zsh'
nnoremap <silent><leader>fz :vsplit $DOTFILES/zsh<cr>

" +git
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_visual_map.g = { 'name': g:which_key_map.g.name }

nnoremap <expr><silent>[c &diff ? '[c' : ':Gitsigns prev_hunk<cr>'
nnoremap <expr><silent>]c &diff ? ']c' : ':Gitsigns next_hunk<cr>'

let g:which_key_map.g.a = 'stage-chunk'
nnoremap <silent><leader>ga :Gitsigns stage_hunk<cr>

let g:which_key_map.g.b = 'blame'
nnoremap <silent><leader>gb :Git blame<cr>

let g:which_key_map.g.c = 'chunk-info'
nnoremap <silent><leader>gc :Gitsigns preview_hunk<cr>

let g:which_key_map.g.o = 'open-browser'
let g:which_key_visual_map.g.o = g:which_key_map.g.o
nnoremap <silent><leader>go :GBrowse<cr>
vnoremap <silent><leader>go :GBrowse<cr>

let g:which_key_map.g.s = 'status'
nnoremap <silent><leader>gs <cmd>Telescope git_status<cr>

let g:which_key_map.g.u = 'chunk-undo'
nnoremap <silent><leader>gu :Gitsigns reset_hunk<cr>

" +lsp
let g:which_key_map.l = { 'name': '+lsp' }
let g:which_key_map.l.a = 'code-action'
let g:which_key_map.l.f = 'format'
let g:which_key_map.l.r = 'rename'

" +diagnostic
let g:which_key_map.l.d = { 'name': '+diagnostic' }

let g:which_key_map.l.d.l = 'diagnostic-list'
nnoremap <silent><leader>ldl <cmd>Telescope diagnostics<cr>

let g:which_key_map.l.d.n = 'diagnostic-next'
nnoremap <silent><leader>ldn :lua vim.diagnostic.goto_next()<cr>

let g:which_key_map.l.d.p = 'diagnostic-prev'
nnoremap <silent><leader>ldp :lua vim.diagnostic.goto_prev()<cr>

let g:which_key_map.l.g = { 'name': '+goto' }
let g:which_key_map.l.g.d = 'definition'
let g:which_key_map.l.g.i = 'implementation'
let g:which_key_map.l.g.r = 'references'
let g:which_key_map.l.g.y = 'type-definition'

let g:which_key_map.l.l = 'lsp-log'
nnoremap <silent><leader>ll <cmd>LspLog<cr>

" +test/toggle
let g:which_key_map.t = { 'name': '+terminal/toggle' }

let g:which_key_map.t.c = 'repl'
nnoremap <silent><leader>tc :call Repl()<cr>

let g:which_key_map.t.p = 'paste-mode'
nnoremap <silent><leader>tp :setlocal paste!<cr>

let g:which_key_map.t.r  = 'run'
nnoremap <silent><leader>tr :call RunFile()<cr>

let g:which_key_map.t.f = 'test-file'
nnoremap <silent><leader>tf :TestFile<cr>

let g:which_key_map.t.n = 'test-near'
nnoremap <silent><leader>tn :TestNearest<cr>

let g:which_key_map.s = 'sort'
let g:which_key_visual_map.s = 'sort'
nnoremap <silent><leader>s :sort<cr>
vnoremap <silent><leader>s :sort<cr>
