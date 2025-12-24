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
      'ruby_lsp',
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

    for _, server in ipairs(mlsp.get_installed_servers()) do
      if not vim.tbl_contains(configured_servers, server) then
        table.insert(configured_servers, server)
      end
    end

    for _, server in ipairs(configured_servers) do
      local config =
        vim.tbl_extend('force', { enable = true }, vim.lsp.config[server])

      if config.enable then
        vim.lsp.enable(server)
      end
    end

    -- I'm not sure I like this yet.
    -- vim.lsp.inline_completion.enable()
  end,
}
