return {
  {
    'stevearc/conform.nvim',
    event = { 'LspAttach', 'BufWritePre' },
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },

      formatters_by_ft = {
        bash = { 'beautysh' },
        go = { 'gofmt', 'goimports' },
        javascript = { 'prettier' },
        lua = { 'stylua' },
        proto = { 'buf' },
        sh = { 'beautysh' },
        sql = { 'sql_formatter' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        xml = { 'xmlformat' },
        zsh = { 'beautysh' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    event = { 'BufWritePre' },
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        bash = { 'shellcheck' },
        eruby = { 'erb_lint' },
        lua = { 'selene' },
        proto = { 'buf_lint' },
        sh = { 'shellcheck' },
        terraform = { 'tflint', 'tfsec' },
        zsh = { 'zsh' },
      }

      vim.api.nvim_create_autocmd(
        { 'BufWritePre', 'BufReadPost', 'InsertLeave' },
        {
          group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
          callback = function()
            lint.try_lint()
          end,
        }
      )
    end,
  },
}
