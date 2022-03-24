inoremap jk <esc>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)

nnoremap <down>  <c-w>-
nnoremap <left>  1<c-w>>
nnoremap <right> 1<c-w><
nnoremap <up>    <c-w>+

nnoremap ;                :
nnoremap <silent><c-p>    <esc>:Files<cr>
nnoremap <silent><c-t>    <esc>:tabnew<cr>
nnoremap <silent><c-w>m   :wincmd _<bar>wincmd <bar><cr>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent>\        <esc>:Buffers<cr>
nnoremap gp               `[v`]
nnoremap j                gj
nnoremap k                gk

nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> H :call TabControl('tabp', 'bp')<cr>
nnoremap <silent> L :call TabControl('tabn', 'bn')<cr>

vnoremap <c-c>             y:call system("pbcopy", getreg("\""))<cr>
vnoremap <silent><leader>  :<c-u>WhichKeyVisual '<Space>'<CR>
vnoremap J                 :m '>+1<cr>gv=gv
vnoremap K                 :m '<-2<cr>gv=gv

tnoremap <Esc> <c-\><c-n>

""""""""""""""""""""""""""""""""""
" vim-which-key related mappings "
""""""""""""""""""""""""""""""""""

let g:which_key_map = {}

nnoremap <silent><leader>q :noh<cr>
let g:which_key_map.q =    'no-highlight'

" +buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '-':     [':%bd|e#|bd#', 'delete-inactive-buffers'],
      \ }

" +file/find
let g:which_key_map.f = {
      \ 'name': '+file/find',
      \ 's':    ['update', 'save-file'],
      \ }

nnoremap <expr><silent><leader>fw ':GGrep '.expand('<cword>').'<cr>'
let g:which_key_map.f.w =         '[BUG] grep-cword'
nnoremap <silent><leader>fv       :vsplit $DOTFILES/vim<cr>
let g:which_key_map.f.v =         'edit-vim'
nnoremap <silent><leader>fz       :vsplit $DOTFILES/zsh<cr>
let g:which_key_map.f.z =         'edit-zsh'

" +git
let g:which_key_map.g = {
      \ 'name': '+git',
      \ 'a':    [':CocCommand git.chunkStage', 'stage-chunk'],
      \ 'c':    [':CocCommand git.chunkInfo',  'chunk-info'],
      \ 's':    [':GFiles?',                   'status'],
      \ 'u':    [':CocCommand git.chunkUndo',  'chunk-undo'],
      \ }

let g:which_key_map.g.b = 'blame'
nnoremap <silent><leader>gb :Git blame<cr>

let g:which_key_map.g.o = 'open-browser'
nnoremap <silent><leader>go :GBrowse<cr>
vnoremap <silent><leader>go :GBrowse<cr>

"+ale/coc
let g:which_key_map.l = {
      \ 'name': '+ale/coc',
      \ 'R':    ['CocRestart',                  'coc-restart'],
      \ 'a':    ['<Plug>(coc-codeaction)',      'code-action'],
      \ 'c':    ['<Plug>(coc-codelens-action)', 'code-lens-action'],
      \ 'd':    ['ALEDetail',                   'ale-detail'],
      \ 'o':    ['lopen',                       'lopen'],
      \ 'r':    ['<Plug>(coc-rename)',          'rename'],
      \ 's':    [':echom coc#status()',         'coc-status'],
      \ }

let g:which_key_map.l.F = 'find-backward'
nnoremap <silent><leader>lF <Plug>(coc-smartf-backward)

let g:which_key_map.l.f = 'find-forward'
nnoremap <silent><leader>lf <Plug>(coc-smartf-forward)

" +diagnostic
let g:which_key_map.l.d = { 'name': '+diagnostic' }

let g:which_key_map.l.d.n = 'diagnostic-next'
nnoremap <silent><leader>ldn :call CocAction('diagnosticNext')<cr>

let g:which_key_map.l.d.p = 'diagnostic-prev'
nnoremap <silent><leader>ldp :call CocAction('diagnosticPrevious')<cr>

let g:which_key_map.l.g = {
      \ 'name': '+goto',
      \ 'd':    ['<Plug>(coc-definition)',      'definition'],
      \ 'i':    ['<Plug>(coc-implementation)',  'implementation'],
      \ 'r':    ['<Plug>(coc-references)',      'references'],
      \ 'y':    ['<Plug>(coc-type-definition)', 'type-definition'],
      \ }

" +test/toggle
let g:which_key_map.t = {
      \ 'name': '+terminal/toggle',
      \ 'c':    [':call Repl()',     'repl'],
      \ 'f':    ['TestFile',         'test-file'],
      \ 'n':    ['TestNearest',      'test-near'],
      \ 'p':    [':setlocal paste!', 'paste-mode'],
      \ 'r':    [':call RunFile()',  'run'],
      \ }

nnoremap <silent><leader>s :sort<cr>
vnoremap <silent><leader>s :sort<cr>
let g:which_key_map.s =    'sort'
