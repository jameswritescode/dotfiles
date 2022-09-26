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

vim.api.nvim_create_user_command(
  'GGrep',
  function(opts)
    require('telescope.builtin').grep_string({ search = opts.args })
  end,
  { nargs = 1 }
)
