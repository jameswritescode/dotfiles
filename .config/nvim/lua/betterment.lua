local group = vim.api.nvim_create_augroup('betterment', { clear = true })

vim.api.nvim_create_autocmd('TermOpen', {
  group = group,

  callback = function(_event)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  group = group,

  callback = function(_event)
    vim.cmd.wincmd('=')
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Strip trailing whitespace on save',
  group = group,

  callback = function(_event)
    local l = vim.fn.line('.')
    local c = vim.fn.col('.')

    vim.cmd('%s/\\s\\+$//e')

    vim.fn.cursor(l, c)
  end,
})
