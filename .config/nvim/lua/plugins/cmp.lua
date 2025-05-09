return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  build = 'cargo +nightly build --release',
  dependencies = {
    'giuxtaposition/blink-cmp-copilot',
    'onsails/lspkind.nvim',
    'rafamadriz/friendly-snippets',
  },
  opts = {
    enabled = function()
      return vim.bo.filetype ~= 'copilot-chat'
    end,
    completion = {
      documentation = {
        auto_show = true,
      },
      list = {
        max_items = 10,
        selection = { preselect = false, auto_insert = true },
      },
    },
    cmdline = {
      enabled = false,
    },
    keymap = {
      ['<CR>'] = { 'accept', 'fallback' },

      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },

      per_filetype = {
        codecompanion = { 'codecompanion' },
      },

      providers = {
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ''
              end, vim.api.nvim_list_bufs())
            end,
          },
        },

        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
