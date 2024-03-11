local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local loop = vim.uv or vim.loop

if not loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  ---------------
  -- Telescope --
  ---------------
  {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope', 'GGrep' },
    config = function() require('user.telescope') end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  ----------------
  -- Treesitter --
  ----------------
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() require('user.treesitter') end,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'RRethy/nvim-treesitter-endwise',
      'andymass/vim-matchup',
      'jameswritescode/nvim-hidesig',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    }
  },

  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_deferred = 1
    end,
  },

  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
  },

  ---------
  -- cmp --
  ---------
  {
    'hrsh7th/nvim-cmp',
    config = function() require('user.cmp') end,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      -- 'zbirenbaum/copilot-cmp',
    }
  },

  -- {
  --   'zbirenbaum/copilot-cmp',
  --   config = function() require('copilot_cmp').setup() end,
  --   dependencies = { 'zbirenbaum/copilot.lua' },
  -- },

  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   config = function()
  --     require('copilot').setup({
  --       panel = { enabled = false },
  --       suggestion = { enabled = false },
  --     })
  --   end,
  -- },

  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip').filetype_extend('ruby', { 'rails' })
    end,
  },

  -----------
  -- Other --
  -----------
  {
    'neovim/nvim-lspconfig',
    config = function() require('user.lsp.lspconfig') end,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'onsails/lspkind.nvim',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    },
  },

  {
    'mfussenegger/nvim-dap',
    config = function() require('user.dap') end,
    event = 'VeryLazy',
  },

  {
    'mfussenegger/nvim-jdtls',
    config = function() require('user.lsp.jdtls') end,
    enabled = false,
    ft = 'java',
  },

  {
    'folke/which-key.nvim',
    config = function() require('user.which-key') end,
    event = 'VeryLazy',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function() require('user.gitsigns') end,
    event = { 'BufReadPre', 'BufNewFile' },
  },

  {
    'Wansmer/treesj',
    event = 'BufReadPre',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'AndrewRadev/splitjoin.vim',
    },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 512,

        langs = {
          ruby = {
            module = {
              both = {
                no_format_with = {},
                fallback = function() vim.cmd('SplitjoinJoin') end,
              },
            },

            class = {
              both = {
                no_format_with = {},
                fallback = function() vim.cmd('SplitjoinSplit') end,
              },
            },
          },
        },
      })

      local langs = require('treesj.langs')['presets']

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        callback = function()
          local opts = { buffer = true }

          if langs[vim.bo.filetype] then
            vim.keymap.set('n', 'gS', '<Cmd>TSJSplit<CR>', opts)
            vim.keymap.set('n', 'gJ', '<Cmd>TSJJoin<CR>', opts)
          else
            vim.keymap.set('n', 'gS', '<Cmd>SplitjoinSplit<CR>', opts)
            vim.keymap.set('n', 'gJ', '<Cmd>SplitjoinJoin<CR>', opts)
          end
        end,
      })
    end,
  },

  {
    'AndrewRadev/splitjoin.vim',
    init = function()
      vim.g.splitjoin_join_mapping = ''
      vim.g.splitjoin_ruby_hanging_args = 0
      vim.g.splitjoin_split_mapping = ''
    end,
  },

  {
    'janko-m/vim-test',
    cmd = { 'TestNearest', 'TestFile' },
  },

  {
    'dense-analysis/ale',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.g.ale_lint_on_enter = 1
      vim.g.ale_lint_on_filetype_changed = 1
      vim.g.ale_lint_on_insert_leave = 1
      vim.g.ale_lint_on_save = 1
      vim.g.ale_lint_on_text_changed = 'normal'
      vim.g.ale_sign_error = '●'
      vim.g.ale_sign_warning = vim.g.ale_sign_error

      vim.g.ale_linters = {
        c = {},
        elixir = {},
        eruby = { 'erblint' },
        go = {},
        java = {},
        javascript = {},
        javascriptreact = {},
        kotlin = {},
        python = {},
        ruby = { 'reek' },
        rust = {},
        sh = {},
        swift = {},
        typescript = {},
        typescriptreact = {},
        zsh = { 'shell', 'shellcheck' },
      }
    end,
  },

  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      require('leap').add_default_mappings()
    end,
  },

  {
    'nvim-zh/colorful-winsep.nvim',
    config = true,
    event = 'WinNew',
  },

  {
    'rest-nvim/rest.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    ft = 'http',
  },

  {
    'stevearc/conform.nvim',
    event = { 'LspAttach', 'BufWritePre' },
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },

      formatters_by_ft = {
        go = { 'gofmt', 'goimports' },
      },
    },
  },

  { 'AndrewRadev/switch.vim',         event = 'VeryLazy' },
  { 'c-brenn/phoenix.vim',            event = 'VeryLazy' },
  { 'catppuccin/nvim',                name = 'catppuccin' },
  { 'christoomey/vim-tmux-navigator', event = 'VeryLazy' },
  { 'elixir-editors/vim-elixir',      event = 'VeryLazy' },
  { 'kchmck/vim-coffee-script',       event = 'VeryLazy' },
  { 'machakann/vim-highlightedyank',  event = 'VeryLazy' },
  { 'mracos/mermaid.vim',             event = 'VeryLazy' },
  { 'rust-lang/rust.vim',             event = 'VeryLazy' },
  { 'tmux-plugins/vim-tmux',          event = 'VeryLazy' },
  { 'tpope/vim-abolish',              event = 'VeryLazy' },
  { 'tpope/vim-apathy',               event = 'VeryLazy' },
  { 'tpope/vim-bundler',              event = 'VeryLazy' },
  { 'tpope/vim-commentary',           event = 'VeryLazy' },
  { 'tpope/vim-endwise',              event = 'VeryLazy' },
  { 'tpope/vim-fugitive',             event = 'VeryLazy' },
  { 'tpope/vim-git',                  event = 'VeryLazy' },
  { 'tpope/vim-rails',                lazy = false },
  { 'tpope/vim-rake',                 event = 'VeryLazy' },
  { 'tpope/vim-repeat',               event = 'VeryLazy' },
  { 'tpope/vim-rhubarb',              event = 'VeryLazy' },
  { 'tpope/vim-sleuth',               lazy = false },
  { 'tpope/vim-speeddating',          event = 'VeryLazy' },
  { 'tpope/vim-surround',             event = 'VeryLazy' },
  { 'tpope/vim-unimpaired',           event = 'VeryLazy' },
  { 'tpope/vim-vinegar',              lazy = false },
  { 'udalov/kotlin-vim',              lazy = false },
  { 'windwp/nvim-autopairs',          event = 'VeryLazy' },
  { 'windwp/nvim-ts-autotag',         event = 'VeryLazy' },
}, {
  defaults = { lazy = true },
})
