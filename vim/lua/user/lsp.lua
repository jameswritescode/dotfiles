local common = require 'user.lsp.common'
local telescope = require 'telescope.builtin'

-- TODO: Is there a better way to do this now?
local function lsp_diagnostic_hover_hack()
  vim.o.eventignore = 'CursorHold'
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore=""]])
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),

  callback = function(event)
    local map_opts = { noremap = true, silent = true, buffer = event.buf }

    vim.keymap.set('n', 'K', lsp_diagnostic_hover_hack, map_opts)

    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, map_opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, map_opts)

    vim.keymap.set('n', '<leader>lgd', telescope.lsp_definitions, map_opts)
    vim.keymap.set('n', '<leader>lgi', telescope.lsp_implementations, map_opts)
    vim.keymap.set('n', '<leader>lgr', telescope.lsp_references, map_opts)
    vim.keymap.set('n', '<leader>lgy', telescope.lsp_type_definitions, map_opts)

    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = event.buf,

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

        common.set_winhighlight(winnr)
      end,
    })
  end
})
