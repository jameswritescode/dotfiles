local function treesitter_status()
  if not vim.g.loaded_nvim_treesitter then
    return ''
  end

  local status = require('nvim-treesitter.statusline').statusline({
    type_patterns = { 'class', 'function', 'method', 'module', 'type' },
    separator = '  ',
    indicator_size = vim.api.nvim_win_get_width(0),
  })

  if not status then
    return ''
  end

  return string.gsub(status, '', '%%#WinBarSep#%%#WinBar#')
end

-- selene: allow(unused_variable)
function CustomWinbar()
  return treesitter_status()
end

vim.o.winbar = '%{%v:lua.CustomWinbar()%}'
