local devicons = require('nvim-web-devicons')

local function custom_tabline()
  local tabs = {}

  for i = 1, vim.fn.tabpagenr('$') do
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local bufname = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    local icon, hl = devicons.get_icon(bufname)
    local current_tab = i == vim.fn.tabpagenr()

    local display = string.format(
      '%s%s',
      icon and string.format('%s ', icon) or '',
      bufname ~= '' and bufname or '[No Name]'
    )

    if current_tab then
      display = string.format('%s', display)
    end

    if hl then
      display = string.format('%%#%s#%s%%#Normal#', hl, display)
    end

    table.insert(tabs, display)
  end

  return table.concat(tabs, '  ')
end

_G.custom_tabline = custom_tabline

vim.o.tabline = "%{%v:lua.custom_tabline()%}"
