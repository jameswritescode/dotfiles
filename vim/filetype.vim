if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  au!
  autocmd bufread,bufnewfile *.mdx setf markdown
  autocmd bufread,bufnewfile *.prisma setf graphql
  autocmd bufread,bufnewfile *.zsh-theme setf zsh
  autocmd bufread,bufnewfile Brewfile,Guardfile,*.rbi setf ruby
  autocmd bufread,bufnewfile kitty.conf setf kitty
augroup END
