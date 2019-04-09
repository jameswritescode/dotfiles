if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  au!
  autocmd bufread,bufnewfile *.applescript setf applescript
  autocmd bufread,bufnewfile *.config setf yaml
  autocmd bufread,bufnewfile *.io setf io
  autocmd bufread,bufnewfile *.tsx setf typescript
  autocmd bufread,bufnewfile *.zsh-theme setf zsh
  autocmd bufread,bufnewfile .babelrc setf json
  autocmd bufread,bufnewfile .sequelizerc setf javascript
  autocmd bufread,bufnewfile Brewfile,*.god setf ruby
augroup END
