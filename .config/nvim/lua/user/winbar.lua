local theme = require('catppuccin.palettes.mocha')

vim.api.nvim_set_hl(0, 'WinBar', { fg = theme.subtext0 })
vim.api.nvim_set_hl(0, 'WinBarSep', { fg = theme.red })

local function treesitter_status()
  if not vim.g.loaded_nvim_treesitter then
    return ''
  end

  local status = require('nvim-treesitter.statusline').statusline({
    type_patterns = { 'class', 'function', 'method', 'module', 'type' },
    separator = '  ',
    indicator_size = vim.api.nvim_win_get_width(0),
  })

  if not status then return '' end

  return string.gsub(status, '', '%%#WinBarSep#%%#WinBar#')
end

local function custom_winbar()
  return treesitter_status()
end

_G.custom_winbar = custom_winbar

vim.o.winbar = "%{%v:lua.custom_winbar()%}"
