local telescope = require('telescope')

telescope.setup({
  defaults = {
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
