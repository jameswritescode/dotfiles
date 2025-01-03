return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'zbirenbaum/copilot.lua',
    },
    event = 'VeryLazy',
    opts = {
      model = 'claude-3.5-sonnet',
    },
    config = function(_plugin, opts)
      if require('plugins.copilot.helpers').copilot_signed_in() then
        require('CopilotChat').setup(opts)
      end
    end,
  },
}
