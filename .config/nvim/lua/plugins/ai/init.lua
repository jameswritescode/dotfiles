return {
  {
    'folke/sidekick.nvim',
    opts = {
      cli = {
        mux = {
          backend = 'tmux',
          enabled = true,
        },
        picker = 'fzf-lua',
      },
    },
  },
}
