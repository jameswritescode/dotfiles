local model = 'claude-3.5-sonnet'

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
      model = model,
    },
  },

  {
    'ravitemer/mcphub.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    build = 'npm install -g mcp-hub@latest',
    opts = {
      extensions = {
        codecompanion = {
          show_result_in_chat = true,
          make_vars = true,
          make_slash_commands = true,
        },
      },
    },
  },

  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      adapters = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                default = model,
              },
            },
          })
        end,
      },

      strategies = {
        chat = {
          tools = {
            mcp = {
              description = 'Call tools and resources from the MCP Servers',
              callback = function()
                return require('mcphub.extensions.codecompanion')
              end,
            },
          },
        },
      },
    },
  },
}
