local which_key = require('which-key')

which_key.setup({
  disable = {
    filetypes = { 'TelescopePrompt' },
  },

  plugins = {
    marks = false,
    registers = false,

    presets = {
      g = false,
      motions = false,
      nav = false,
      operators = false,
      windows = false,
      z = false,
    },
  },
})

which_key.register(vim.g.which_key_map, { prefix = '<leader>' })

which_key.register(
  vim.g.which_key_visual_map,
  { mode = 'v', prefix = '<leader>' }
)
