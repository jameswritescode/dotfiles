return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local group =
        vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  {
    'RRethy/nvim-treesitter-endwise',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      max_lines = 3,
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'andymass/vim-matchup',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
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
