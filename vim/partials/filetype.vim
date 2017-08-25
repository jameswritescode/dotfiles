autocmd filetype gitcommit setlocal spell
autocmd filetype go setlocal textwidth=0
autocmd filetype crontab setlocal nobackup nowritebackup
autocmd filetype slime setlocal commentstring=/\ %s
autocmd filetype diff nnoremap <buffer> <leader>w :noautocmd w<cr>

autocmd bufreadpost *.god set ft=ruby
