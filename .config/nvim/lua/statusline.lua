local devicons = require('nvim-web-devicons')

local lsp_status = require('lsp.status')

local modes = {
  unknown = { hl = 'StatuslineModeUnknown' },

  n = { hl = 'StatuslineModeNormal', name = 'NORMAL' },
  nt = { hl = 'StatuslineModeNormal', name = 'NORMAL' },

  v = { hl = 'StatuslineModeVisual', name = 'VISUAL' },
  V = { hl = 'StatuslineModeVisual', name = 'VISUAL BLOCK' },
  [''] = { hl = 'StatuslineModeVisual', name = 'VISUAL BLOCK' },

  R = { hl = 'StatuslineModeReplace', name = 'REPLACE' },
  c = { hl = 'StatuslineModeCommand', name = 'COMMAND' },
  i = { hl = 'StatuslineModeInsert', name = 'INSERT' },
  t = { hl = 'StatuslineModeTerminal', name = 'TERMINAL' },
}

local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })

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
    str = '%%#StatuslineDiagnosticError#%s %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.WARN,
    str = '%%#StatuslineDiagnosticWarn#%s %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.INFO,
    str = '%%#StatuslineDiagnosticInfo#%s %s%%#Normal#',
  },
  {
    type = vim.diagnostic.severity.HINT,
    str = '%%#StatuslineDiagnosticHint#%s %s%%#Normal#',
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
