vim.cmd('source ~/dotfiles/vim/init-old.vim')

require 'user.options'
require 'user.lazy'
require 'user.keymaps'
require 'user.lsp'

vim.cmd.colorscheme 'catppuccin'

require 'user.statusline'
require 'user.tabline'
require 'user.winbar'
