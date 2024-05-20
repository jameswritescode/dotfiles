vim.cmd('source ~/dotfiles/.config/nvim/init-old.vim')

require 'options'
require 'plugins.lazy'
require 'keymaps'
require 'lsp'

vim.cmd.colorscheme 'catppuccin'

require 'statusline'
require 'tabline'
require 'winbar'
