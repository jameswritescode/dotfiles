nmap <leader>j <plug>(easymotion-bd-w)
nmap <leader>k <plug>(easymotion-bd-f)

imap <c-k> <plug>(neosnippet_expand_or_jump)

inoremap jk            <esc>
inoremap <expr><C-h>   deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>    deoplete#smart_close_popup()."\<C-h>"

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

nnoremap ;          :
nnoremap <c-p>      <esc>:Files<cr>
nnoremap <c-t>      <esc>:tabnew<cr>
nnoremap <down>     <c-w>-
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>p  :set paste!<cr>
nnoremap <leader>q  :noh<cr>
nnoremap <leader>sb <c-^><cr>
nnoremap <leader>sc :CoffeeWatch vert<cr>
nnoremap <leader>tb :Tagbar<cr>
nnoremap <leader>z  <c-z>
nnoremap <left>     1<c-w>>
nnoremap <right>    1<c-w><
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tn :TestNearest<cr>
nnoremap <up>       <c-w>+
nnoremap H          gT
nnoremap L          gt
nnoremap gp         `[v`]
nnoremap <leader>w  :w<cr>

vnoremap J :m  '>+1<cr>gv=gv
vnoremap K :m  '<-2<cr>gv=gv
vnoremap <c-c> y:call system("pbcopy", getreg("\""))<cr>

tnoremap <Esc> <c-\><c-n>
