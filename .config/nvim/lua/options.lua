vim.o.cmdheight = 1

vim.diagnostic.config({
  virtual_text = false,

  float = {
    border = 'rounded',
    scope = 'cursor',
    source = true,
    focusable = false,

    format = function(d)
      return string.format("[%s] %s", d.code, d.message)
    end,
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '┣',
      [vim.diagnostic.severity.WARN] = '┣',
      [vim.diagnostic.severity.INFO] = '┣',
      [vim.diagnostic.severity.HINT] = '┣',
    }
  },
})
