source ~/dotfiles/vim/partials/settings.vim

let g:mapleader="\<Space>"

source ~/dotfiles/vim/partials/mappings.vim

augroup betterment
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd VimResized * wincmd =
augroup END


filetype off

source ~/dotfiles/vim/partials/plugins.vim

lua <<EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
EOF

filetype plugin indent on

if !exists('g:syntax_on')
  syntax enable
endif

source ~/dotfiles/vim/partials/highlights.vim
source ~/dotfiles/vim/partials/functions.vim
source ~/dotfiles/vim/partials/statusline.vim
source ~/dotfiles/vim/partials/tabline.vim

colors onedark
