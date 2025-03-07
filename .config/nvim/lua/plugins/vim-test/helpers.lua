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

      vim.cmd.redrawtabline()
    end,
  })
end

return {
  buffer_status = buffer_status,
  strategy = strategy,
}
