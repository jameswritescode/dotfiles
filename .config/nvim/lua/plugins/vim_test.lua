local theme = require('catppuccin.palettes.mocha')

local exit_code_hl = {
  [0] = 'VimTestStatusPassed',
  [1] = 'VimTestStatusFailed',
}

local function buffer_status(bufnr)
  local status, result =
    pcall(vim.api.nvim_buf_get_var, bufnr, 'vim_test_status')

  if not status then
    return
  end

  local result_status = result.status

  local icon = result_status == 'running' and '󰤑' or '󰙨'
  local hl = result_status == 'running' and 'VimTestStatusRunning'
    or exit_code_hl[result.exit_code]
    or 'VimTestStatusUnknown'

  return { icon = icon, hl = hl }
end

local function init()
  vim.api.nvim_set_hl(0, 'VimTestStatusFailed', { fg = theme.red })
  vim.api.nvim_set_hl(0, 'VimTestStatusPassed', { fg = theme.green })
  vim.api.nvim_set_hl(0, 'VimTestStatusRunning', { fg = theme.yellow })
  vim.api.nvim_set_hl(0, 'VimTestStatusUnknown', { fg = theme.blue })
end

local function strategy(cmd)
  vim.api.nvim_command('-tabnew')

  local bufnr = vim.api.nvim_get_current_buf()

  vim.b.vim_test_status = { status = 'running' }

  vim.fn.termopen(cmd, {
    on_exit = function(_jid, exit_code)
      vim.api.nvim_buf_set_var(
        bufnr,
        'vim_test_status',
        { status = 'finished', exit_code = exit_code }
      )

      vim.api.nvim_command('redrawtabline')
    end,
  })
end

return {
  buffer_status = buffer_status,
  init = init,
  strategy = strategy,
}
