local ensure_packer = function()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('user.telescope') end,
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  -- nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('user.cmp') end,
  }

  -- LSP
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'onsails/lspkind.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/mason.nvim'

  use {
    'neovim/nvim-lspconfig',
    config = function() require('user.lsp') end,
  }

  -- Treesitter
  use 'RRethy/nvim-treesitter-endwise'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('user.treesitter') end,
  }

  use {
    'omnisyle/nvim-hidesig',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  }

  use {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_deferred = 1
    end,
  }

  -- Other
  use 'AndrewRadev/switch.vim'
  use 'c-brenn/phoenix.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'diepm/vim-rest-console'
  use 'editorconfig/editorconfig-vim'
  use 'elixir-editors/vim-elixir'
  use 'kchmck/vim-coffee-script'
  use 'machakann/vim-highlightedyank'
  use 'mracos/mermaid.vim'
  use 'navarasu/onedark.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'rust-lang/rust.vim'
  use 'tmux-plugins/vim-tmux'
  use 'tpope/vim-abolish'
  use 'tpope/vim-apathy'
  use 'tpope/vim-bundler'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-git'
  use 'tpope/vim-haml'
  use 'tpope/vim-rails'
  use 'tpope/vim-rake'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-vinegar'
  use 'windwp/nvim-autopairs'

  use {
    'folke/which-key.nvim',
    config = function() require('user.which-key') end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('user.gitsigns') end,
  }

  use {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_ruby_hanging_args = 0
    end,
  }

  use {
    'lifepillar/pgsql.vim',
    config = function()
      vim.g.sql_type_default = 'pgsql'
    end,
  }

  use {
    'janko-m/vim-test',
    cmd = { 'TestNearest', 'TestFile' },
  }

  use {
    'SirVer/ultisnips',
    config = function()
      vim.g.UltiSnipsEnableSnipMate = 0
    end,
  }

  use {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_settings = {
        javascript = {
          extends = 'jsx'
        },
      }
    end,
  }

  use {
    'dense-analysis/ale',
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
        sh = {},
        swift = {},
        typescript = {},
        typescriptreact = {},
        zsh = { 'shell', 'shellcheck' },
      }
    end,
  }

  if packer_bootstrap then
    packer.sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])
