local RUBY_PATH = vim.env.DAP_RUBY_DEBUG_SOCKET_PATH or '/tmp/ruby-debug/'
local RUST_DEBUG_TARGET_PATH = vim.fn.getcwd() .. '/target/debug/'

return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  config = function()
    local dap = require('dap')

    dap.defaults.fallback.focus_terminal = true

    vim.api.nvim_create_autocmd('ExitPre', {
      callback = function()
        if dap.session() then
          dap.disconnect()
        end
      end,
    })

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

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = require('mason-registry')
          .get_package('codelldb')
          :get_install_path() .. '/codelldb',
        args = { '--port', '${port}' },
      },
    }

    dap.configurations.rust = {
      {
        name = 'Debug executable',
        type = 'codelldb',
        request = 'launch',
        program = function()
          local path = vim.fn.input({
            prompt = 'Path to executable',
            default = RUST_DEBUG_TARGET_PATH,
            completion = 'file',
          })

          return (path and path ~= '') and path or dap.ABORT
        end,
      },
    }
  end,
}
