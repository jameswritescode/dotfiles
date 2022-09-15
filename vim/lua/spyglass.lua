local telescope = require('telescope')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<c-h>'] = 'which_key',
        ['<c-j>'] = 'move_selection_next',
        ['<c-k>'] = 'move_selection_previous',
      },
    },

    vimgrep_arguments = {
      'git',
      'grep',
      '--column',
      '--full-name',
      '--line-number',
      '--no-color',
    },
  },
})

telescope.load_extension('fzf')
