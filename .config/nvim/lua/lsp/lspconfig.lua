local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

local common = require('lsp.common')

require('java').setup()

vim.diagnostic.config {
  virtual_text = false,
  float = {
    border = 'rounded',
    scope = 'cursor',
    source = true,
    focusable = false,

    format = function(d)
      return string.format("[%s] %s", d.code, d.message)
    end,
  },
}

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())

local defaults = {
  capabilities = capabilities,
}

local server_configs = {
  graphql = {
    autostart = false,
  },

  sorbet = {
    root_dir = lspconfig.util.root_pattern('sorbet'),
  },

  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },

        telemetry = {
          enable = false,
        },

        workspace = {
          checkThirdParty = false,

          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },

          completion = {
            callSnippet = 'Replace',
          },
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

require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      local server_config = server_configs[server_name] or {}

      lspconfig[server_name].setup(merge(defaults, server_config))
    end
  },
})
