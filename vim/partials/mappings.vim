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
nnoremap <expr><leader>fw ":GGrep " . expand("<cword>") . "<cr>"
nnoremap <leader>ev       :vsplit $DOTFILES/vim<cr>
nnoremap <leader>ez       :vsplit $HOME/.zshrc<cr>
nnoremap <leader>p        :set paste!<cr>
nnoremap <leader>q        :noh<cr>
nnoremap <leader>sb       <c-^><cr>
nnoremap <leader>tb       :Tagbar<cr>
nnoremap <leader>tf       :TestFile<cr>
nnoremap <leader>tn       :TestNearest<cr>
nnoremap <leader>w        :w<cr>
nnoremap <leader>z        <c-z>
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

vnoremap <c-c> y:call system("pbcopy", getreg("\""))<cr>
vnoremap J :m  '>+1<cr>gv=gv
vnoremap K :m  '<-2<cr>gv=gv

tnoremap <Esc> <c-\><c-n>
