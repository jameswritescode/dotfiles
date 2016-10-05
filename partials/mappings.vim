nmap <leader>j <plug>(easymotion-overwin-w)
nmap <leader>k <plug>(easymotion-overwin-f)

inoremap jk <esc>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap ; :
nnoremap gp `[v`]
nnoremap <leader>z <c-z>
nnoremap H gT
nnoremap L gt
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>sb <c-^><cr>
nnoremap <leader>sc :CoffeeWatch vert<cr>
nnoremap <leader>tb :Tagbar<cr>
nnoremap <leader>q :noh<cr>
nnoremap <silent> <leader>tn :TestNearest<cr>
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <c-t>   <esc>:tabnew<cr>
nnoremap <up>    <c-w>+
nnoremap <down>  <c-w>-
nnoremap <left>  1<c-w>>
nnoremap <right> 1<c-w><

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap <c-c> y:call system("pbcopy", getreg("\""))<cr>
