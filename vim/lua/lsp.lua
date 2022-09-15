local cmp = require 'cmp'
local cmp_lsp = require 'cmp_nvim_lsp'
local lspconfig = require 'lspconfig'
local lspconfigs = require 'lspconfig.configs'
local null_ls = require('null-ls')

require('mason').setup()
require('mason-lspconfig').setup()

vim.diagnostic.config { virtual_text = false }

function lsp_diagnostic_hover_hack()
  vim.o.eventignore = 'CursorHold'
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore=""]])
end

local window_opts = cmp.config.window.bordered()

local function set_winhighlight(winnr)
  if winnr then
    vim.api.nvim_win_set_option(winnr, 'winhl', window_opts.winhighlight)
  end
end

local map_opts = { noremap = true, silent = true }

local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua lsp_diagnostic_hover_hack()<CR>', map_opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>Telescope lsp_definitions<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', '<cmd>Telescope lsp_implementations<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgr', '<cmd>Telescope lsp_references<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgy', '<cmd>Telescope lsp_type_definitions<CR>', map_opts)

  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,

    callback = function()
      local opts = {
        border = 'rounded',
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        focusable = false,
        scope = 'cursor',
        source = 'always',

        format = function(diagnostic)
          return string.format("[%s] %s", diagnostic.code, diagnostic.message)
        end
      }

      local _, winnr = vim.diagnostic.open_float(opts)

      set_winhighlight(winnr)
    end
  })
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

local function hover(_, result, ctx, config)
  local bufnr, winnr = vim.lsp.handlers.hover(_, result, ctx, config)

  set_winhighlight(winnr)

  return bufnr, winnr
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(hover, window_opts)

local function merge(t1, t2)
  local new_table = {}

  for _, t in ipairs({t1, t2}) do
    for k, v in pairs(t) do
      new_table[k] = v
    end
  end

  return new_table
end

local servers = {
  'bashls',
  'gopls',
  'graphql',
  'shopify_ruby_lsp',
  'solargraph',
  'sorbet',
  'sumneko_lua',
  'tailwindcss',
  'tsserver',
  'vimls',
}

local defaults = {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfigs.shopify_ruby_lsp = {
  default_config = {
    cmd = { 'bundle', 'exec', 'ruby-lsp' },
    filetypes = { 'ruby' },
    root_dir = lspconfig.util.root_pattern('Gemfile'),
  }
}

local in_spin = os.getenv('SPIN') == '1'

local overrides = {
  graphql = {
    autostart = false,
  },

  shopify_ruby_lsp = {
    autostart = in_spin,
  },

  solargraph = {
    autostart = not in_spin,
  },

  sorbet = {
    root_dir = lspconfig.util.root_pattern('sorbet'),
  },

  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },

        telemetry = {
          enable = false,
        },

        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
      }
    },
  },

  tailwindcss = {
    autostart = false,
  },
}

for _, server in ipairs(servers) do
  lspconfig[server].setup(merge(defaults, overrides[server]))
end
