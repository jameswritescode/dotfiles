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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', map_opts)

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
    end,
  })
end

local formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.rustfmt,
  },

  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = formatting_augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

local function hover(_, result, ctx, config)
  local bufnr, winnr = vim.lsp.handlers.hover(_, result, ctx, config)

  set_winhighlight(winnr)

  return bufnr, winnr
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(hover, window_opts)

local function merge(t1, t2)
  if not t2 then return t1 end

  return vim.tbl_extend('force', t1, t2)
end

local servers = {
  'bashls',
  'gopls',
  'graphql',
  'lua_ls',
  'rust_analyzer',
  'shopify_ruby_lsp',
  'solargraph',
  'sorbet',
  'tailwindcss',
  'tsserver',
  'vimls',
}

local defaults = {
  capabilities = cmp_lsp.default_capabilities(),
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
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePre', 'CursorHold' }, {
        buffer = bufnr,

        callback = function()
          local params = vim.lsp.util.make_text_document_params(bufnr)

          client.request(
            'textDocument/diagnostic',
            { textDocument = params },
            function(err, result)
              if err then return end

              vim.lsp.diagnostic.on_publish_diagnostics(
                nil,
                vim.tbl_extend('keep', params, { diagnostics = result.items }),
                { client_id = client.id }
              )
            end
          )
        end,
      })
    end,
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
