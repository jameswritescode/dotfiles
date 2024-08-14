--# selene: allow(mixed_table)

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
  ----------------
  -- Treesitter --
  ----------------
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
      require('plugins.treesitter')
    end,
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
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'zbirenbaum/copilot-cmp',
    },
    event = 'InsertEnter',
    config = function()
      require('plugins.cmp')
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = true,
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip').filetype_extend('ruby', { 'rails' })
    end,
  },

  ---------
  -- LSP --
  ---------
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'onsails/lspkind.nvim',
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
      {
        'nvim-java/nvim-java',
        cond = vim.env.USE_JAVA ~= nil,
        opts = {
          spring_boot_tools = { enable = false },
        },
      },
    },
    config = function()
      require('lsp.lspconfig')
    end,
  },

  {
    'williamboman/mason.nvim',
    config = true,
    event = 'VeryLazy',
  },

  -------------
  -- Copilot --
  -------------
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('plugins.copilot').plugin_setup()
    end,
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'zbirenbaum/copilot.lua',
    },
    branch = 'canary',
    event = 'VeryLazy',
    config = function()
      if require('plugins.copilot').copilot_signed_in() then
        require('CopilotChat').setup()
      end
    end,
  },

  -----------
  -- Other --
  -----------
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    config = function()
      require('plugins.dap')
    end,
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.which-key')
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        changedelete = { text = '◢' },
        delete = { text = '◢' },
        topdelete = { text = '◥' },
        untracked = { text = '┋' },
      },

      signs_staged = {
        add = { text = '┃' },
        change = { text = '┃' },
        changedelete = { text = '◢' },
        delete = { text = '◢' },
        topdelete = { text = '◥' },
        untracked = { text = '┋' },
      },
    },
  },

  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'AndrewRadev/splitjoin.vim',
    },
    event = 'BufReadPre',
    config = function()
      require('treesj').setup({
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
    'vim-test/vim-test',
    cmd = { 'TestNearest', 'TestFile' },
    config = function()
      local vim_test = require('plugins.vim_test')

      vim_test.init()

      vim.g['test#custom_strategies'] = { basic_plus = vim_test.strategy }
      vim.g['test#strategy'] = 'basic_plus'
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

  -- {
  --   'rest-nvim/rest.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   event = 'VeryLazy',
  --   ft = 'http',
  -- },

  {
    'stevearc/conform.nvim',
    event = { 'LspAttach', 'BufWritePre' },
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },

      formatters_by_ft = {
        bash = { 'beautysh' },
        go = { 'gofmt', 'goimports' },
        lua = { 'stylua' },
        proto = { 'buf' },
        sh = { 'beautysh' },
        sql = { 'sql_formatter' },
        zsh = { 'beautysh' },
      },
    },
  },

  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.fzf').setup()
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      local devicons = require('nvim-web-devicons')
      local icons = devicons.get_icons()

      local ruby_types = {
        'brewfile',
        'config.ru',
        'erb',
        'gemfile$',
        'gemspec',
        'rake',
        'rakefile',
        'rb',
      }

      for _, n in pairs(ruby_types) do
        icons[n].color = '#cc342d'
      end

      devicons.setup()
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = { 'BufWritePre' },
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        bash = { 'shellcheck' },
        eruby = { 'erb_lint' },
        lua = { 'selene' },
        sh = { 'shellcheck' },
        terraform = { 'tflint', 'tfsec' },
        zsh = { 'zsh' },
      }

      vim.api.nvim_create_autocmd(
        { 'BufWritePre', 'BufReadPost', 'InsertLeave' },
        {
          group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
          callback = function()
            lint.try_lint()
          end,
        }
      )
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
  },

  {
    'stevearc/oil.nvim',
    config = true,
    opts = {
      use_default_keymaps = false,
      keymaps = {
        ['<CR>'] = 'actions.select',
      },
    },
  },

  {
    'tpope/vim-projectionist',
    init = function()
      require('plugins.vim-projectionist')
    end,
  },

  { 'AndrewRadev/switch.vim', event = 'VeryLazy' },
  { 'c-brenn/phoenix.vim', event = 'VeryLazy' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'christoomey/vim-tmux-navigator', event = 'VeryLazy' },
  { 'elixir-editors/vim-elixir', event = 'VeryLazy' },
  { 'kchmck/vim-coffee-script', event = 'VeryLazy' },
  { 'machakann/vim-highlightedyank', event = 'VeryLazy' },
  { 'mracos/mermaid.vim', event = 'VeryLazy' },
  { 'rust-lang/rust.vim', event = 'VeryLazy' },
  { 'tmux-plugins/vim-tmux', event = 'VeryLazy' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-apathy', event = 'VeryLazy' },
  { 'tpope/vim-bundler', event = 'VeryLazy' },
  { 'tpope/vim-commentary', event = 'VeryLazy' },
  { 'tpope/vim-endwise', event = 'VeryLazy' },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'tpope/vim-git', event = 'VeryLazy' },
  { 'tpope/vim-rails' },
  { 'tpope/vim-rake', event = 'VeryLazy' },
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  { 'tpope/vim-rhubarb', event = 'VeryLazy' },
  { 'tpope/vim-sleuth' },
  { 'tpope/vim-speeddating', event = 'VeryLazy' },
  { 'tpope/vim-surround', event = 'VeryLazy' },
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  { 'udalov/kotlin-vim' },
  { 'windwp/nvim-autopairs', event = 'VeryLazy' },
  { 'windwp/nvim-ts-autotag', event = 'VeryLazy' },
})
