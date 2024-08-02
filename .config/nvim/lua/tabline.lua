local devicons = require('nvim-web-devicons')
local theme = require('catppuccin.palettes.mocha')

local vim_test = require('plugins.vim_test')

local function set_active_highlight(devicon_hl)
  local hl = vim.api.nvim_get_hl(0, { name = devicon_hl })

  vim.api.nvim_set_hl(0, 'TabLineSel', { fg = hl.fg, bg = theme.surface0 })
end

local function custom_tabline()
  local tabs = {}
  local current_tab = vim.fn.tabpagenr()

  for i = 1, vim.fn.tabpagenr('$') do
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local bufname = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    local test_result = vim_test.buffer_status(bufnr)

    local icon, hl

    if test_result then
      icon, hl = test_result.icon, test_result.hl
    else
      icon, hl = devicons.get_icon(bufname)
    end

    local display = string.format(
      ' %s%s ',
      icon and string.format('%s ', icon) or '',
      bufname ~= '' and bufname or '[No Name]'
    )

    if i == current_tab then
      set_active_highlight(hl)

      display = string.format('%%#TabLineSel#%s%%#Normal#', display)
    elseif hl then
      display = string.format('%%#%s#%s%%#Normal#', hl, display)
    end

    table.insert(tabs, display)
  end

  return table.concat(tabs)
end

_G.custom_tabline = custom_tabline

vim.o.tabline = '%{%v:lua.custom_tabline()%}'
