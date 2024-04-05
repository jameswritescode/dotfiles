local theme = require('catppuccin.palettes.mocha')

vim.cmd(
  string.format(
    [[
      highlight WinBar guifg=%s
      highlight WinBarSep guifg=%s
    ]],
    theme.subtext0,
    theme.red
  )
)

local function treesitter_status()
  if not vim.g.loaded_nvim_treesitter then
    return ''
  end

  local status = require('nvim-treesitter.statusline').statusline({
    type_patterns = { 'class', 'function', 'method', 'module', 'type' },
    separator = ' %#WinBarSep#%#WinBar# ',
    indicator_size = vim.api.nvim_win_get_width(0),
  })

  return status
end

local function custom_winbar()
  return treesitter_status() or ''
end

_G.custom_winbar = custom_winbar

vim.o.winbar = "%{%v:lua.custom_winbar()%}"
