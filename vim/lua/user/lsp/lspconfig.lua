local cmp_lsp = require 'cmp_nvim_lsp'
local lspconfig = require 'lspconfig'
local lspconfigs = require 'lspconfig.configs'
local null_ls = require('null-ls')

local common = require('user.lsp.common')

require('mason').setup()
require('mason-lspconfig').setup()

vim.diagnostic.config { virtual_text = false }

local capabilities = cmp_lsp.default_capabilities()
local formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  sources = {
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

  common.set_winhighlight(winnr)

  return bufnr, winnr
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(hover, common.window_opts)

local function merge(t1, t2)
  if not t2 then return t1 end

  return vim.tbl_extend('force', t1, t2)
end

local servers = {
  'bashls',
  'emmet_ls',
  'gopls',
  'graphql',
  'jdtls',
  'kotlin_language_server',
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
  capabilities = capabilities,
  on_attach = common.on_attach,
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
      common.on_attach(client, bufnr)

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePre', 'CursorHold' }, {
        buffer = bufnr,

        callback = function()
          local params = vim.lsp.util.make_text_document_params(bufnr)

          client.request(
            'textDocument/diagnostic',
            { textDocument = params },
            function(err, result)
              if err then return end
              if not result then return end

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
    root_dir = lspconfig.util.root_pattern('.solargraph.yml'),
  },

  sorbet = {
    root_dir = lspconfig.util.root_pattern('sorbet'),
  },

  lua_ls = {
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

  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
}

for _, server in ipairs(servers) do
  lspconfig[server].setup(merge(defaults, overrides[server]))
end
