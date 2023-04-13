local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
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
    }
  },

  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_deferred = 1
    end,
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
      'zbirenbaum/copilot-cmp',
    }
  },

  {
    'zbirenbaum/copilot-cmp',
    config = function() require('copilot_cmp').setup() end,
    dependencies = { 'zbirenbaum/copilot.lua' },
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    config = function()
      require('copilot').setup({
        panel = { enabled = false },
        suggestion = { enabled = false },
      })
    end,
  },

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
    config = function() require('user.lsp') end,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'jose-elias-alvarez/null-ls.nvim',
      'onsails/lspkind.nvim',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    }
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
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',
    config = function()
      vim.g.splitjoin_ruby_hanging_args = 0
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
        javascript = {},
        javascriptreact = {},
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

  { 'AndrewRadev/switch.vim', event = 'VeryLazy' },
  { 'c-brenn/phoenix.vim', event = 'VeryLazy' },
  { 'christoomey/vim-tmux-navigator', event = 'VeryLazy' },
  { 'diepm/vim-rest-console', event = 'VeryLazy' },
  { 'elixir-editors/vim-elixir', event = 'VeryLazy' },
  { 'kchmck/vim-coffee-script', event = 'VeryLazy' },
  { 'machakann/vim-highlightedyank', event = 'VeryLazy' },
  { 'mracos/mermaid.vim', event = 'VeryLazy' },
  { 'navarasu/onedark.nvim', event = 'VeryLazy' },
  { 'rust-lang/rust.vim', event = 'VeryLazy' },
  { 'tmux-plugins/vim-tmux', event = 'VeryLazy' },
  { 'tpope/vim-abolish', event = 'VeryLazy' },
  { 'tpope/vim-apathy', event = 'VeryLazy' },
  { 'tpope/vim-bundler', event = 'VeryLazy' },
  { 'tpope/vim-commentary', event = 'VeryLazy' },
  { 'tpope/vim-endwise', event = 'VeryLazy' },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'tpope/vim-git', event = 'VeryLazy' },
  { 'tpope/vim-haml', event = 'VeryLazy' },
  { 'tpope/vim-rails', event = 'VeryLazy' },
  { 'tpope/vim-rake', event = 'VeryLazy' },
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  { 'tpope/vim-rhubarb', event = 'VeryLazy' },
  { 'tpope/vim-sleuth', lazy = false },
  { 'tpope/vim-speeddating', event = 'VeryLazy' },
  { 'tpope/vim-surround', event = 'VeryLazy' },
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  { 'tpope/vim-vinegar', event = 'VeryLazy' },
  { 'windwp/nvim-autopairs', event = 'VeryLazy' },
  { 'windwp/nvim-ts-autotag', event = 'VeryLazy' },
}, {
  defaults = { lazy = true },
})
