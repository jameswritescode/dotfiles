vim.cmd('source ~/dotfiles/vim/init-old.vim')

require 'user.lazy'

pcall(vim.cmd, 'colorscheme onedark')
