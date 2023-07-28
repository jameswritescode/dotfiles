local dap = require('dap')

dap.adapters.ruby = function(callback)
  vim.ui.select(
    { 'tmp/rdbg-socket-server', 'tmp/rdbg-socket-worker' },
    { prompt = 'Select socket' },
    function(pipe)
      callback {
        type = 'pipe',
        pipe = pipe,
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
