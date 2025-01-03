local blink = require('blink.cmp')
local lspconfig = require('lspconfig')
local mlsp = require('mason-lspconfig')

local common = require('lsp.common')

local original_hover = vim.lsp.buf.hover

--- @diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return original_hover(common.window_opts)
end

local capabilities =
  blink.get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

local defaults = {
  capabilities = capabilities,
}

local server_configs = {
  sorbet = {
    root_dir = lspconfig.util.root_pattern('sorbet'),
  },
}

local mason_server_configs = {
  graphql = {
    autostart = false,
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
      },
    },
  },

  tailwindcss = {
    autostart = false,
  },

  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          allFeatures = true,
          command = 'clippy',
          extraArgs = { '--no-deps' },
        },
      },
    },
  },

  yamlls = {
    on_new_config = function(new_config)
      new_config.settings.yaml.schemas = vim.tbl_deep_extend(
        'force',
        new_config.settings.yaml.schemas or {},
        require('schemastore').yaml.schemas()
      )
    end,

    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },

      yaml = {
        validate = true,

        format = {
          enable = true,
        },

        schemaStore = {
          enable = false,
          url = '',
        },
      },
    },
  },
}

-- Sometimes LSP's may already be installed on the system, but Mason should
-- still be able to install and configure them otherwise.
local all_server_configs =
  vim.tbl_extend('force', server_configs, mason_server_configs)

mlsp.setup({
  handlers = {
    function(server_name)
      local server_config = all_server_configs[server_name] or {}

      lspconfig[server_name].setup(
        vim.tbl_extend('force', defaults, server_config)
      )
    end,
  },
})

local mason_installed_servers = mlsp.get_installed_servers()

for server_name, config in pairs(server_configs) do
  if not vim.list_contains(mason_installed_servers, server_name) then
    lspconfig[server_name].setup(vim.tbl_extend('force', defaults, config))
  end
end
