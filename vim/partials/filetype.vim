autocmd filetype crontab setlocal nobackup nowritebackup
autocmd filetype diff nnoremap <buffer> <leader>w :noautocmd w<cr>
autocmd filetype gitcommit setlocal spell
autocmd filetype go setlocal textwidth=0
" autocmd filetype html call rainbow#toggle()
" autocmd filetype sh call rainbow#toggle()
autocmd filetype slime setlocal commentstring=/\ %s

autocmd bufreadpost *.applescript set ft=applescript
autocmd bufreadpost *.god set ft=ruby
autocmd bufreadpost *.tsx set ft=typescript
autocmd bufreadpost *.zsh-theme set ft=zsh
autocmd bufreadpost .babelrc set ft=json
autocmd bufreadpost .sequelizerc set ft=javascript
autocmd bufreadpost Brewfile set ft=ruby
