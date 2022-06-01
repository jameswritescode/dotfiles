local cmp = require 'cmp'
local cmp_lsp = require 'cmp_nvim_lsp'
local lspconfig = require 'lspconfig'

require('nvim-lsp-installer').setup {}

vim.diagnostic.config { virtual_text = false }

function lsp_diagnostic_hover_hack()
  vim.o.eventignore = 'CursorHold'
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore=""]])
end

local map_opts = { noremap = true, silent = true }

local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua lsp_diagnostic_hover_hack()<CR>', map_opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)

  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,

    callback = function()
      local opts = {
        border = 'rounded',
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        focusable = false,
        prefix = '- ',
        scope = 'cursor',
        source = 'always',

        format = function(diagnostic)
          return string.format("[%s] %s", diagnostic.code, diagnostic.message)
        end
      }

      vim.diagnostic.open_float(opts)
    end
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, cmp.config.window.bordered())
}

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
  'solargraph',
  'sorbet',
  'sumneko_lua',
  'tailwindcss',
  'tsserver',
  'vimls',
}

local defaults = {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}

local overrides = {
  graphql = {
    autostart = false,
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
