local theme = require('catppuccin.palettes.mocha')

vim.cmd(
  string.format(
    [[
      highlight WinBar guifg=%s
      highlight WinBarSeparator guifg=%s
    ]],
    theme.subtext0,
    theme.red
  )
)

local function treesitter_status()
  if not vim.g.loaded_nvim_treesitter then
    return ''
  end

  local buf = vim.api.nvim_get_current_buf()
  local win = vim.fn.bufwinid(buf)
  local width = vim.api.nvim_win_get_width(win)

  local status = require('nvim-treesitter.statusline').statusline({
    type_patterns = { 'class', 'function', 'method', 'module', 'type' },
    separator = ' %#WinBarSeparator#%#WinBar# ',
    indicator_size = width,
  })

  return status
end

local function custom_winbar()
  return treesitter_status() or ''
end

_G.custom_winbar = custom_winbar

vim.o.winbar = "%{%v:lua.custom_winbar()%}"
