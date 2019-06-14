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

nnoremap ;                 :
nnoremap <silent> <c-p>    <esc>:Files<cr>
nnoremap <silent> <c-t>    <esc>:tabnew<cr>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap gp                `[v`]
nnoremap j                 gj
nnoremap k                 gk

nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> H :call <sid>tabline_control('tabp', 'bp')<cr>
nnoremap <silent> L :call <sid>tabline_control('tabn', 'bn')<cr>

function! s:tabline_control(tab_cmd, buf_cmd) abort
  let a:tabnrs = []

  exec tabpagenr('$') > 1 ? a:tab_cmd : a:buf_cmd
endfunction

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

nnoremap <silent><leader>r :call <sid>run_file()<cr>
let g:which_key_map.r =    'run'

let s:runners = {
      \ 'elixir': 'elixir',
      \ 'haskell': 'runhaskell',
      \ 'io': 'io',
      \ 'javascript': 'node',
      \ 'lua': 'lua',
      \ 'perl': 'perl',
      \ 'php': 'php',
      \ 'python': 'python',
      \ 'ruby': 'ruby',
      \ 'rust': 'rustc',
      \ 'sh': 'sh',
      \ 'zsh': 'zsh',
      \ }

function! s:run_file()
  let l:filetype = split(&filetype, '\\.')[0]

  if has_key(s:runners, l:filetype)
    let l:runner = s:runners[l:filetype]

    execute 'wincmd v | terminal ' . l:runner . ' ' . expand('%:p')
  else
    echo 'no runner'
  endif
endfunction

" +buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '-':     [':%bd|e#|bd#', 'delete-inactive-buffers'],
      \ '?':     ['Buffers',     'fzf-buffer'],
      \ 'f':     ['bfirst',      'first-buffer'],
      \ 'h':     ['Startify',    'home-buffer'],
      \ 'l':     ['blast',       'last-buffer'],
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
      \ 'b':    ['Gblame',                     'blame'],
      \ 'c':    [':CocCommand git.chunkInfo',  'chunk-info'],
      \ 's':    [':GFiles?',                   'status'],
      \ 'u':    [':CocCommand git.chunkUndo',  'chunk-undo'],
      \ }

"+ale/coc
let g:which_key_map.l = {
      \ 'name': '+ale/coc',
      \ 'a':    ['<Plug>(coc-codeaction)',      'code-action'],
      \ 'c':    ['<Plug>(coc-codelens-action)', 'code-lens-action'],
      \ 'd':    ['ALEDetail',                   'ale-detail'],
      \ 'f':    ['<Plug>(coc-format-selected)', 'formatting'],
      \ 'r':    ['<Plug>(coc-rename)',          'rename'],
      \ }

let g:which_key_map.l.g = {
      \ 'name': '+goto',
      \ 'd':    ['<Plug>(coc-definition)',      'definition'],
      \ 'i':    ['<Plug>(coc-implementation)',  'implementation'],
      \ 'r':    ['<Plug>(coc-references)',      'references'],
      \ 'y':    ['<Plug>(coc-type-definition)', 'type-definition'],
      \ }

" +test/toggle
let g:which_key_map.t = {
      \ 'name': '+test/toggle',
      \ 'f':    ['TestFile',        'test-file'],
      \ 'n':    ['TestNearest',     'test-near'],
      \ 'p':    [':setlocal paste!', 'paste-mode'],
      \ }

nnoremap <silent><leader>s :sort<cr>
vnoremap <silent><leader>s :sort<cr>
let g:which_key_map.s =    'sort'
