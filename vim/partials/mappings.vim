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

nnoremap <down>  <c-w>-
nnoremap <left>  1<c-w>>
nnoremap <right> 1<c-w><
nnoremap <up>    <c-w>+

nnoremap ;                :
nnoremap <silent><c-p>    <esc>:Files<cr>
nnoremap <silent><c-t>    <esc>:tabnew<cr>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap H                gT
nnoremap L                gt
nnoremap gp               `[v`]
nnoremap j                gj
nnoremap k                gk

nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

vnoremap <c-c>             y:call system("pbcopy", getreg("\""))<cr>
vnoremap <silent><leader>  :<c-u>WhichKeyVisual '<Space>'<CR>
vnoremap J                 :m '>+1<cr>gv=gv
vnoremap K                 :m '<-2<cr>gv=gv

tnoremap <Esc> <c-\><c-n>

""""""""""""""""""""""""""""""""""
" vim-which-key related mappings "
""""""""""""""""""""""""""""""""""

let g:which_key_map = {
      \ 'r': 'forrest-run',
      \ 'w': ['w', 'write-file'],
      \ }

nnoremap <silent><leader>p :set paste!<cr>
let g:which_key_map.p =    'toggle-paste'
nnoremap <silent><leader>q :noh<cr>
let g:which_key_map.q =    'no-highlight'

" +buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1': ['b1',        'buffer 1'],
      \ '2': ['b2',        'buffer 2'],
      \ '?': ['Buffers',   'fzf-buffer'],
      \ 'd': ['bd',        'delete-buffer'],
      \ 'f': ['bfirst',    'first-buffer'],
      \ 'h': ['Startify',  'home-buffer'],
      \ 'l': ['blast',     'last-buffer'],
      \ 'n': ['bnext',     'next-buffer'],
      \ 'p': ['bprevious', 'previous-buffer'],
      \ }

" +file
let g:which_key_map.f = {
      \ 'name': '+file',
      \ 's': ['update', 'save-file']
      \ }

nnoremap <expr><silent><leader>fw ':GGrep '.expand('<cword>').'<cr>'
let g:which_key_map.f.w =         '[BUG] grep-cword'
nnoremap <silent><leader>fv       :vsplit $DOTFILES/vim<cr>
let g:which_key_map.f.v =         'edit-vim'
nnoremap <silent><leader>fz       :vsplit $DOTFILES/zsh<cr>
let g:which_key_map.f.z =         'edit-zsh'

" +test
let g:which_key_map.t = {
      \ 'name': '+test',
      \ 'f': ['TestFile',    'test-file'],
      \ 'n': ['TestNearest', 'test-near'],
      \ }

vnoremap <silent><leader>s :sort<cr>
let g:which_key_map.s =    'sort'
