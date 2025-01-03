return {
  'vim-test/vim-test',
  cmd = { 'TestNearest', 'TestFile' },
  config = function()
    local vim_test = require('plugins.vim-test.helpers')

    vim.g['test#custom_strategies'] = { basic_plus = vim_test.strategy }
    vim.g['test#strategy'] = 'basic_plus'
  end,
}
