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

    vim.lsp.config('*', {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    local configured_servers = {
      'graphql',
      'kotlin_language_server',
      'lua_ls',
      'rust_analyzer',
      'sorbet',
      'sourcekit',
      'tailwindcss',
      'yamlls',
    }

    mlsp.setup({
      ensure_installed = {},
      automatic_enable = false,
    })

    local servers =
      vim.tbl_extend('force', configured_servers, mlsp.get_installed_servers())

    for _, server in ipairs(servers) do
      local config =
        vim.tbl_extend('force', { enable = true }, vim.lsp.config[server])

      if config.enable then
        vim.lsp.enable(server)
      end
    end
  end,
}
