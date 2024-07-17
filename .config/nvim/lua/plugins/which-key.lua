--# selene: allow(mixed_table)

local which_key = require('which-key')

which_key.setup({
  plugins = {
    marks = false,
    registers = false,

    presets = {
      g = false,
      motions = false,
      nav = false,
      operators = false,
      text_objects = true,
      windows = false,
      z = false,
    },
  },
})

which_key.add({
  { '<leader>a', group = 'ai' },
  { '<leader>b', group = 'buffer' },
  { '<leader>d', group = 'dap' },
  { '<leader>f', group = 'fzf' },
  { '<leader>g', group = 'git' },
  { '<leader>l', group = 'lsp' },
  { '<leader>la', desc = 'code-action' },
  { '<leader>ld', group = 'diagnostic' },
  { '<leader>lf', desc = 'format' },
  { '<leader>lg', group = 'goto' },
  { '<leader>lgd', desc = 'definition' },
  { '<leader>lgi', desc = 'implementation' },
  { '<leader>lgr', desc = 'references' },
  { '<leader>lgy', desc = 'type-definition' },
  { '<leader>lr', desc = 'rename' },
  { '<leader>t', group = 'terminal/toggle' },
})

which_key.add({
  mode = { 'v' },
  { '<leader>a', group = 'ai' },
  { '<leader>g', group = 'git' },
})
