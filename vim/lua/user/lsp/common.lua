local cmp = require 'cmp'

local common = {}

-- TODO: Is there a better way to do this now?
function lsp_diagnostic_hover_hack()
  vim.o.eventignore = 'CursorHold'
  vim.lsp.buf.hover()
  vim.cmd([[autocmd CursorMoved <buffer> ++once set eventignore=""]])
end

common.window_opts = cmp.config.window.bordered()

function common.set_winhighlight(winnr)
  if not winnr then return end

  vim.wo[winnr].winhl = common.window_opts.winhighlight
end

function common.on_attach(_, bufnr)
  local map_opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'K', '<cmd>lua lsp_diagnostic_hover_hack()<CR>', map_opts)

  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, map_opts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, map_opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, map_opts)

  vim.keymap.set('n', '<leader>lgd', '<cmd>Telescope lsp_definitions<CR>', map_opts)
  vim.keymap.set('n', '<leader>lgi', '<cmd>Telescope lsp_implementations<CR>', map_opts)
  vim.keymap.set('n', '<leader>lgr', '<cmd>Telescope lsp_references<CR>', map_opts)
  vim.keymap.set('n', '<leader>lgy', '<cmd>Telescope lsp_type_definitions<CR>', map_opts)

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

      common.set_winhighlight(winnr)
    end,
  })
end

return common
