local dap = require('dap')

dap.defaults.fallback.focus_terminal = true

dap.adapters.ruby = function(callback)
  vim.ui.select(
    vim.fn.readdir('/tmp/ruby-debug'),
    { prompt = 'Select socket' },
    function(pipe)
      if not pipe then return end

      callback {
        type = 'pipe',
        pipe = '/tmp/ruby-debug/' .. pipe,
      }
    end
  )
end

dap.configurations.ruby = {
  {
    name = 'rdbg-attach',
    request = 'attach',
    type = 'ruby',
  },
}

vim.api.nvim_create_autocmd('ExitPre', {
  callback = function()
    dap.disconnect()
  end,
})
