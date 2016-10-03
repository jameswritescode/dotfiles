map <leader>sb <c-^><cr>
map <leader>tt :call RunCurrentSpecFile()<cr>
map <leader>ts :call RunNearestSpec()<cr>
map <leader>p :set paste!<cr>
map <leader>j <plug>(easymotion-bd-w)
map <leader>k <plug>(easymotion-bd-f)

vmap <c-c> y:call system("pbcopy", getreg("\""))<cr>

nmap <leader>sc :CoffeeWatch vert<cr>
nmap <leader>tb :Tagbar<cr>
nmap <leader>q :noh<cr>
nmap <leader>j <plug>(easymotion-overwin-w)
nmap <leader>k <plug>(easymotion-overwin-f)

noremap <up>    <c-w>+
noremap <down>  <c-w>-
noremap <left>  1<c-w>>
noremap <right> 1<c-w><
noremap <c-t>   <esc>:tabnew<cr>

inoremap jk <esc>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

nnoremap ; :
nnoremap ; :
nnoremap gp `[v`]
nnoremap <leader>z <c-z>
nnoremap H gT
nnoremap L gt
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
