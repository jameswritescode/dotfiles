return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  config = function()
    local dap = require('dap')

    dap.defaults.fallback.focus_terminal = true

    local RUBY_PATH = vim.env.DAP_RUBY_DEBUG_SOCKET_PATH or '/tmp/ruby-debug/'

    dap.adapters.ruby = function(callback)
      vim.ui.select(
        vim.fn.readdir(RUBY_PATH),
        { prompt = 'Select socket' },
        function(pipe)
          if not pipe then
            return
          end

          callback({
            type = 'pipe',
            pipe = RUBY_PATH .. pipe,
          })
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
        if dap.session() then
          dap.disconnect()
        end
      end,
    })
  end,
}
