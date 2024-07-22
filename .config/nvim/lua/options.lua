vim.o.cmdheight = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.diagnostic.config({
  virtual_text = false,

  float = {
    border = 'rounded',
    scope = 'cursor',
    source = true,
    focusable = false,

    format = function(d)
      return string.format('[%s] %s', d.code, d.message)
    end,
  },

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '┣',
      [vim.diagnostic.severity.WARN] = '┣',
      [vim.diagnostic.severity.INFO] = '┣',
      [vim.diagnostic.severity.HINT] = '┣',
    },
  },
})
