vim.cmd('source ~/dotfiles/vim/init-old.vim')

require 'user.lazy'
require 'user.keymaps'
require 'user.lsp'

vim.cmd.colorscheme 'catppuccin'
