vim.cmd('source ~/dotfiles/.config/nvim/init-old.vim')

-- TODO: Remove this after 0.12
if vim.lsp.get_clients then
  vim.lsp.get_active_clients = vim.lsp.get_clients
end

require 'options'
require 'plugins.lazy'
require 'keymaps'
require 'lsp'

vim.cmd.colorscheme 'catppuccin'

require 'statusline'
require 'tabline'
require 'winbar'
