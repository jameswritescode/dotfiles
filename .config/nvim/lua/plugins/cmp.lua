return {
  'saghen/blink.cmp',
  branch = 'v1',
  build = 'cargo +nightly build --release',
  event = 'InsertEnter',
  dependencies = {
    'fang2hou/blink-copilot',
    'folke/sidekick.nvim',
    'onsails/lspkind.nvim',
    'rafamadriz/friendly-snippets',
    'xzbdmw/colorful-menu.nvim',
  },
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
      list = {
        max_items = 10,
        selection = { preselect = false, auto_insert = true },
      },
      menu = {
        draw = {
          columns = { { 'kind_icon' }, { 'label', gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require('colorful-menu').blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require('colorful-menu').blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
    },
    cmdline = {
      enabled = false,
    },
    keymap = {
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<Tab>'] = {
        'select_next',
        'snippet_forward',
        -- I'm not sure I like this yet.
        -- function()
        --   return vim.lsp.inline_completion.get()
        -- end,
        'fallback',
      },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },

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
          async = true,
          module = 'blink-copilot',
          name = 'copilot',
        },
      },
    },
  },
}
