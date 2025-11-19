return {
  {
    'williamboman/mason.nvim',
    config = true,
    event = 'VeryLazy',
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      sign_priority = 100,

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
    'AndrewRadev/splitjoin.vim',
    init = function()
      vim.g.splitjoin_join_mapping = ''
      vim.g.splitjoin_ruby_hanging_args = 0
      vim.g.splitjoin_split_mapping = ''
    end,
  },

  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
  },

  {
    'nvim-zh/colorful-winsep.nvim',
    config = true,
    event = 'WinLeave',
  },

  -- {
  --   'rest-nvim/rest.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   event = 'VeryLazy',
  --   ft = 'http',
  -- },

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
      view_options = {
        show_hidden = true,
      },
    },
  },

  {
    'akinsho/git-conflict.nvim',
    config = true,
    event = 'VeryLazy',
  },

  {
    'b0o/SchemaStore.nvim',
    lazy = true,
  },

  {
    'echasnovski/mini.pairs',
    config = true,
    event = 'InsertEnter',
  },

  { 'AndrewRadev/switch.vim', event = 'VeryLazy' },
  { 'c-brenn/phoenix.vim', event = 'VeryLazy' },
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
  { 'tpope/vim-rake', event = 'VeryLazy' },
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  { 'tpope/vim-rhubarb', event = 'VeryLazy' },
  { 'tpope/vim-sleuth' },
  { 'tpope/vim-speeddating', event = 'VeryLazy' },
  { 'tpope/vim-surround', event = 'VeryLazy' },
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  { 'udalov/kotlin-vim' },
  { 'windwp/nvim-ts-autotag', event = 'VeryLazy' },
}
