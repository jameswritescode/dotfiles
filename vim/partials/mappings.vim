let g:which_key_map = {
\ 'r': 'forrest-run'
\ }

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
nnoremap <c-b>            <esc>:Buffers<cr>
nnoremap <c-p>            <esc>:Files<cr>
nnoremap <c-t>            <esc>:tabnew<cr>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap H                gT
nnoremap L                gt
nnoremap gp               `[v`]
nnoremap j                gj
nnoremap k                gk

nnoremap <leader>p      :set paste!<cr>
let g:which_key_map.p = 'toggle-paste'
nnoremap <leader>q      :noh<cr>
let g:which_key_map.q = 'no-highlight'
nnoremap <leader>w      :w<cr>
let g:which_key_map.w = 'save'

" +edit
let g:which_key_map.e =   {'name': '+edit'}
nnoremap <leader>ev       :vsplit $DOTFILES/vim<cr>
let g:which_key_map.e.v = 'edit-vim'
nnoremap <leader>ez       :vsplit $DOTFILES/zsh<cr>
let g:which_key_map.e.z = 'edit-zsh'

" +find
let g:which_key_map.f =   {'name': '+find'}
nnoremap <expr><leader>fw ':GGrep '.expand('<cword>').'<cr>'
let g:which_key_map.f.w = '[BUG] grep-cword'

" +test
let g:which_key_map.t =   {'name': '+test'}
nnoremap <leader>tf       :TestFile<cr>
let g:which_key_map.t.f = 'test-file'
nnoremap <leader>tn       :TestNearest<cr>
let g:which_key_map.t.n = 'test-near'

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

vnoremap <silent><leader>s :sort<cr>
let g:which_key_map.s =    'sort'

tnoremap <Esc> <c-\><c-n>
