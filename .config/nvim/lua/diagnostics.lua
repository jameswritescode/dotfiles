local virtual_lines = {
  current_line = true,

  format = function(d)
    return string.format('%s [%s]', d.message, d.code)
  end,
}

local config = {
  severity_sort = true,
  virtual_lines = false,

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '󰋼',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
}

return {
  init = function()
    vim.diagnostic.config(config)
  end,

  disable_virtual_lines = function()
    vim.diagnostic.config({ virtual_lines = false })
  end,

  enable_virtual_lines = function()
    vim.diagnostic.config({ virtual_lines = virtual_lines })
  end,
}
