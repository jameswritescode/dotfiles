vim.cmd('source ~/dotfiles/vim/init-old.vim')

pcall(vim.cmd, 'colorscheme onedark')

-- require 'user.packer'
require 'user.lazy'
