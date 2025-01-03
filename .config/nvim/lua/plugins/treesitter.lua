return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
      'andymass/vim-matchup',
      'jameswritescode/nvim-hidesig',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup({
        autotag = {
          enable = true,
        },

        endwise = {
          enable = false,
        },

        ensure_installed = {
          'bash',
          'comment',
          'css',
          'go',
          'graphql',
          'html',
          'http',
          'java',
          'javascript',
          'json',
          'kotlin',
          'lua',
          'markdown',
          'markdown_inline',
          'php',
          'query',
          'ruby',
          'rust',
          'toml',
          'tsx',
          'typescript',
          'vimdoc',
        },

        hidesig = {
          enable = true,
          delay = 200,
          opacity = 0.75,
        },

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },

        matchup = {
          enable = true,
        },

        textobjects = {
          select = {
            enable = true,

            lookahead = true,

            keymaps = {
              ['ab'] = '@block.outer',
              ['ib'] = '@block.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ap'] = '@parameter.outer',
              ['ip'] = '@parameter.inner',
            },
          },
        },
      })
    end,
  },

  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  },

  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_deferred = 1

      vim.g.matchuppref = {
        html = { tagnameonly = 1 },
      }
    end,
  },

  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'AndrewRadev/splitjoin.vim',
    },
    event = 'BufReadPre',
    opts = {
      use_default_keymaps = false,
      max_join_length = 512,

      langs = {
        ruby = {
          module = {
            both = {
              no_format_with = {},
              fallback = function()
                vim.cmd('SplitjoinJoin')
              end,
            },
          },

          class = {
            both = {
              no_format_with = {},
              fallback = function()
                vim.cmd('SplitjoinSplit')
              end,
            },
          },
        },
      },
    },
    config = function(_plugin, opts)
      require('treesj').setup(opts)

      local langs = require('treesj.langs')['presets']

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        callback = function()
          local kopts = { buffer = true }

          if langs[vim.bo.filetype] then
            vim.keymap.set('n', 'gS', '<Cmd>TSJSplit<CR>', kopts)
            vim.keymap.set('n', 'gJ', '<Cmd>TSJJoin<CR>', kopts)
          else
            vim.keymap.set('n', 'gS', '<Cmd>SplitjoinSplit<CR>', kopts)
            vim.keymap.set('n', 'gJ', '<Cmd>SplitjoinJoin<CR>', kopts)
          end
        end,
      })
    end,
  },
}
