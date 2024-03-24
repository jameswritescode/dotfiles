local devicons = require('nvim-web-devicons')
local theme = require('catppuccin.palettes.mocha')

local modes = {
  unknown = { hl = 'StatuslineModeUnknown', color = theme.subtext0 },

  v = { hl = 'StatuslineModeVisual', color = theme.yellow, name = 'VISUAL' },
  V = { hl = 'StatuslineModeVisual', color = theme.yellow, name = 'VISUAL BLOCK' },
  [''] = { hl = 'StatuslineModeVisual', color = theme.yellow, name = 'VISUAL BLOCK' },

  R = { hl = 'StatuslineModeReplace', color = theme.red, name = 'REPLACE' },
  c = { hl = 'StatuslineModeCommand', color = theme.teal, name = 'COMMAND' },
  i = { hl = 'StatuslineModeInsert', color = theme.blue, name = 'INSERT' },
  n = { hl = 'StatuslineModeNormal', color = theme.green, name = 'NORMAL' },
  t = { hl = 'StatuslineModeTerminal', color = theme.lavender, name = 'TERMINAL' },
}

local function generate_highlights()
  local vim_highlights = {}

  for _, config in pairs(modes) do
    table.insert(
      vim_highlights,
      string.format(
        'highlight %s guifg=%s',
        config.hl,
        config.color
      )
    )
  end

  return table.concat(vim_highlights, '\n')
end

vim.cmd(
  string.format(
    [[
      %s

      highlight StatuslineSubtext guifg=%s
    ]],
    generate_highlights(),
    theme.subtext0
  )
)

vim.cmd(generate_highlights())

local function get_filetype()
  if vim.bo.buftype ~= '' then
    return vim.bo.buftype
  end

  return vim.bo.filetype
end

local function filename()
  local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
  local icon, hl = devicons.get_icon(name)

  if not icon then return '%#Normal#%t' end

  return string.format('%%#%s# %s %%t%%#Normal#', hl, icon)
end

local function git_branch()
  local head = vim.g.gitsigns_head

  if not head then return '' end

  return string.format('%%#StatuslineSubtext# %s%%#Normal#', vim.g.gitsigns_head)
end

local function git_status()
  local status = vim.b.gitsigns_status_dict

  if not status then return '' end

  local parts = {
    { n = status.added,   str = '%%#GitSignsAdd#+%s%%#Normal#' },
    { n = status.changed, str = '%%#GitSignsChange#~%s%%#Normal#' },
    { n = status.removed, str = '%%#GitSignsDelete#-%s%%#Normal#' },
  }

  local output = {}

  for _, part in ipairs(parts) do
    if part.n and part.n > 0 then
      table.insert(output, string.format(part.str, part.n))
    end
  end

  return table.concat(output, ' ')
end

local diagnostic_formatting = {
  {
    type = vim.diagnostic.severity.ERROR,
    str = '%%#DiagnosticFloatingError# %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.WARN,
    str = '%%#DiagnosticFloatingWarn# %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.INFO,
    str = '%%#DiagnosticFloatingInfo#󰋼 %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.HINT,
    str = '%%#DiagnosticFloatingHint# %s%%#Normal#',
  },
}

local function diagnostics()
  local counts = vim.diagnostic.count(0)
  local output = {}

  for _, part in ipairs(diagnostic_formatting) do
    local n = counts[part.type]

    if n then
      table.insert(output, string.format(part.str, n))
    end
  end

  return table.concat(output, ' ')
end

local function lsp()
  local clients = #vim.lsp.get_clients({ bufnr = 0 })

  if clients == 0 then return '' end

  return '%#StatuslineSubtext#LSP%#Normal#'
end

local function current_mode()
  local mode = vim.api.nvim_get_mode().mode
  local mapped_mode = modes[mode]
  local display = mapped_mode and mapped_mode.name or string.format('UNKNOWN (%s)', mode)
  local hl = (mapped_mode or modes.unknown).hl

  return string.format('%%#%s#%s%%#Normal#', hl, display)
end

local spacer = '  '

local function custom_statusline()
  return table.concat({
    filename(),
    spacer,
    git_branch(),
    spacer,
    git_status(),
    '%=',
    diagnostics(),
    spacer,
    lsp(),
    spacer,
    current_mode(),
  })
end

_G.custom_statusline = custom_statusline

vim.o.statusline = "%{%v:lua.custom_statusline()%}"
