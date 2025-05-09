return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
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
    local mlsp = require('mason-lspconfig')

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local defaults = {
      capabilities = capabilities,
    }

    local server_configs = {
      sorbet = {
        root_markers = { 'sorbet' },
      },

      kotlin_language_server = {
        settings = {
          kotlin = {
            formatting = {
              formatter = 'none',
            },
          },
        },
      },

      sourcekit = {},

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

    mlsp.setup({
      automatic_enable = false,
      ensure_installed = {},
    })

    local mason_installed_servers = mlsp.get_installed_servers()

    for _, server in pairs(mason_installed_servers) do
      if not server_configs[server] then
        server_configs[server] = {}
      end
    end

    for server_name, config in pairs(server_configs) do
      vim.lsp.config(server_name, vim.tbl_extend('force', defaults, config))
      vim.lsp.enable(server_name)
    end
  end,
}
