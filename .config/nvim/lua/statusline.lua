local devicons = require('nvim-web-devicons')
local theme = require('catppuccin.palettes.mocha')

local lsp_status = require('lsp.status')

local modes = {
  unknown = { hl = 'StatuslineModeUnknown', color = theme.subtext0 },

  n = { hl = 'StatuslineModeNormal', color = theme.green, name = 'NORMAL' },
  nt = { hl = 'StatuslineModeNormal', color = theme.green, name = 'NORMAL' },

  v = { hl = 'StatuslineModeVisual', color = theme.yellow, name = 'VISUAL' },
  V = {
    hl = 'StatuslineModeVisual',
    color = theme.yellow,
    name = 'VISUAL BLOCK',
  },
  [''] = {
    hl = 'StatuslineModeVisual',
    color = theme.yellow,
    name = 'VISUAL BLOCK',
  },

  R = { hl = 'StatuslineModeReplace', color = theme.red, name = 'REPLACE' },
  c = { hl = 'StatuslineModeCommand', color = theme.teal, name = 'COMMAND' },
  i = { hl = 'StatuslineModeInsert', color = theme.blue, name = 'INSERT' },

  t = {
    hl = 'StatuslineModeTerminal',
    color = theme.lavender,
    name = 'TERMINAL',
  },
}

local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })

for _, config in pairs(modes) do
  vim.api.nvim_set_hl(0, config.hl, { fg = config.color, bg = normal.bg })
end

local git_hl = {
  add = vim.api.nvim_get_hl(0, { name = 'GitSignsAdd' }),
  change = vim.api.nvim_get_hl(0, { name = 'GitSignsChange' }),
  delete = vim.api.nvim_get_hl(0, { name = 'GitSignsDelete' }),
}

local highlights = {
  MsgArea = { fg = theme.overlay0 },
  StatuslineFilename = { fg = theme.text },
  StatuslineGitAdd = { fg = git_hl.add.fg },
  StatuslineGitChange = { fg = git_hl.change.fg },
  StatuslineGitDelete = { fg = git_hl.delete.fg },
  StatuslineLspFinished = { fg = theme.green },
  StatuslineLspWorking = { fg = theme.yellow },
  StatuslineSubtext = { fg = theme.subtext0 },
}

for name, config in pairs(highlights) do
  vim.api.nvim_set_hl(
    0,
    name,
    vim.tbl_extend('force', config, { bg = normal.bg })
  )
end

local function filename()
  local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
  local icon, icon_color = devicons.get_icon_colors(name)

  vim.api.nvim_set_hl(
    0,
    'StatuslineFilename',
    { fg = icon_color, bg = normal.bg }
  )

  if vim.bo.filetype == 'oil' then
    return '%#StatuslineFilename#󱡠'
  elseif not icon then
    return '%#StatuslineFilename#%t'
  end

  return string.format('%%#StatuslineFilename#%s %%t%%#Normal#', icon)
end

local function git_branch()
  local head = vim.g.gitsigns_head

  if not head then
    return ''
  end

  return string.format(
    '%%#StatuslineSubtext# %s%%#Normal#',
    vim.g.gitsigns_head
  )
end

local function git_status()
  local status = vim.b.gitsigns_status_dict

  if not status then
    return ''
  end

  local parts = {
    { n = status.added, str = '%%#StatuslineGitAdd#+%s%%#Normal#' },
    { n = status.changed, str = '%%#StatuslineGitChange#~%s%%#Normal#' },
    { n = status.removed, str = '%%#StatuslineGitDelete#-%s%%#Normal#' },
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
    str = '%%#DiagnosticFloatingError#%s %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.WARN,
    str = '%%#DiagnosticFloatingWarn#%s %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.INFO,
    str = '%%#DiagnosticFloatingInfo#%s %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.HINT,
    str = '%%#DiagnosticFloatingHint#%s %s%%#Normal#',
  },
}

local signs = vim.diagnostic.config().signs.text or {}

local function diagnostics()
  local counts = vim.diagnostic.count(0)
  local output = {}

  for _, part in ipairs(diagnostic_formatting) do
    local n = counts[part.type]

    if n then
      table.insert(output, string.format(part.str, signs[part.type], n))
    end
  end

  return table.concat(output, ' ')
end

local function lsp()
  local status = lsp_status.buffer_status(vim.fn.bufnr())

  if status == nil then
    return nil
  elseif status then
    return '%#StatuslineLspFinished#LSP%#Normal#'
  else
    return '%#StatuslineLspWorking#LSP%#Normal#'
  end
end

local function current_mode()
  local mode = vim.api.nvim_get_mode().mode
  local mapped_mode = modes[mode]
  local hl = (mapped_mode or modes.unknown).hl

  local display = mapped_mode and mapped_mode.name
    or string.format('UNKNOWN (%s)', mode)

  return string.format('%%#%s#%s%%#Normal#', hl, display)
end

local spacer = '  '

-- selene: allow(unused_variable)
function CustomStatusLine()
  local lsp_result = lsp()
  local lsp_buffer_status = lsp_result and lsp_result .. spacer or ''

  return table.concat({
    filename(),
    spacer,
    git_branch(),
    spacer,
    git_status(),
    '%=',
    diagnostics(),
    spacer,
    lsp_buffer_status,
    current_mode(),
  })
end

vim.o.statusline = '%{%v:lua.CustomStatusLine()%}'
