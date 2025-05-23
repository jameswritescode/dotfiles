local fzf = require('fzf-lua')

local diagnostics = require('diagnostics')
local status = require('lsp.status')

status.register_autocmds()

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),

  callback = function(event)
    local map_opts = { noremap = true, silent = true, buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, map_opts)

    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, map_opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, map_opts)

    vim.keymap.set('n', '<leader>lgi', fzf.lsp_implementations, map_opts)
    vim.keymap.set('n', '<leader>lgy', fzf.lsp_typedefs, map_opts)

    vim.keymap.set('n', '<leader>lgd', function()
      fzf.lsp_definitions({ jump1 = true })
    end, map_opts)

    vim.keymap.set('n', '<leader>lgr', function()
      fzf.lsp_references({ jump1 = true })
    end, map_opts)

    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = event.buf,
      callback = diagnostics.enable_virtual_lines,
    })

    vim.api.nvim_create_autocmd('CursorMoved', {
      buffer = event.buf,
      callback = diagnostics.disable_virtual_lines,
    })
  end,
})
