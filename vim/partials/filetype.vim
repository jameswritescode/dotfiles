autocmd filetype crontab setlocal nobackup nowritebackup
autocmd filetype diff nnoremap <buffer> <leader>w :noautocmd w<cr>
autocmd filetype gitcommit setlocal spell
autocmd filetype go setlocal textwidth=0
autocmd filetype html call rainbow#toggle()
autocmd filetype sh call rainbow#toggle()
autocmd filetype slime setlocal commentstring=/\ %s

autocmd bufreadpost *.applescript set ft=applescript
autocmd bufreadpost *.god set ft=ruby
autocmd bufreadpost Brewfile set ft=ruby

" templates
autocmd bufnewfile *app/controllers/*.rb 0r $DOTFILES/vim/templates/rails/controller.rb
autocmd bufnewfile *app/graphql/input_types/*.rb 0r $DOTFILES/vim/templates/rails/input_type.rb
autocmd bufnewfile *app/graphql/resolvers/*.rb 0r $DOTFILES/vim/templates/rails/resolver.rb
autocmd bufnewfile *app/graphql/types/*.rb 0r $DOTFILES/vim/templates/rails/type.rb
autocmd bufnewfile *app/models/*.rb 0r $DOTFILES/vim/templates/rails/model.rb
autocmd bufnewfile *app/policies/*.rb 0r $DOTFILES/vim/templates/rails/policy.rb
autocmd bufnewfile *app/services/*.rb 0r $DOTFILES/vim/templates/rails/service.rb

autocmd bufnewfile *.jsx 0r $DOTFILES/vim/templates/react/component.jsx
