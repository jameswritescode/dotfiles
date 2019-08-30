if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  au!
  autocmd bufread,bufnewfile *.applescript setf applescript
  autocmd bufread,bufnewfile *.config setf yaml
  autocmd bufread,bufnewfile *.io setf io
  autocmd bufread,bufnewfile *.mdx setf markdown
  autocmd bufread,bufnewfile *.vim setlocal foldmethod=marker
  autocmd bufread,bufnewfile *.zsh-theme setf zsh
  autocmd bufread,bufnewfile .babelrc setf json
  autocmd bufread,bufnewfile .flowconfig setlocal commentstring=#\ %s
  autocmd bufread,bufnewfile .sequelizerc setf javascript
  autocmd bufread,bufnewfile Brewfile,*.god,Guardfile,*.rbi setf ruby
  autocmd bufread,bufnewfile kitty.conf setf kitty

  " TODO: Remove once vim/neovim/plugins have their ft's sorted out
  autocmd bufread,bufnewfile *.jsx setf javascript.jsx
augroup END
