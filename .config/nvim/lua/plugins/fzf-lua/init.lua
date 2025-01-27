return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'ThePrimeagen/harpoon',
  },
  opts = {
    'telescope',
    file_ignore_patterns = { '%.rbi' },
    winopts = {
      on_create = function()
        vim.keymap.set('t', '<c-j>', '<down>', { silent = true, buffer = true })
      end,
    },
  },
  config = function(_plugin, opts)
    local fzf = require('fzf-lua')

    fzf.setup(opts)
    fzf.register_ui_select()
  end,
}
