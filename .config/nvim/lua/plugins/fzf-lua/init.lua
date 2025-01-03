return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'ThePrimeagen/harpoon',
  },
  opts = {
    'telescope',
    file_ignore_patterns = { '%.rbi' },
  },
  config = function(_plugin, opts)
    local fzf = require('fzf-lua')

    fzf.setup(opts)
    fzf.register_ui_select()
  end,
}
