map <leader>sb <C-^><CR>
map <leader>tt :call RunCurrentSpecFile()<CR>
map <leader>ts :call RunNearestSpec()<CR>
map <leader>p :set paste!<cr>
map <leader>j <plug>(easymotion-bd-w)
map <leader>k <plug>(easymotion-bd-f)

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>

nmap <leader>sc :CoffeeWatch vert<cr>
nmap <leader>tb :Tagbar<cr>
nmap <leader>q :noh<cr>
nmap <leader>j <plug>(easymotion-overwin-w)
nmap <leader>k <plug>(easymotion-overwin-f)

noremap <up>    <c-w>+
noremap <down>  <c-w>-
noremap <left>  1<c-w>>
noremap <right> 1<c-w><

inoremap jk <esc>

nnoremap gp `[v`]
nnoremap J O<esc>Dj
nnoremap K o<esc>Dk
nnoremap <leader>z <c-z>
