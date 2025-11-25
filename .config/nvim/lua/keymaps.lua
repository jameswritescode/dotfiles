local dap = require('dap')
local fzf = require('fzf-lua')
local gitsigns = require('gitsigns')
local harpoon = require('harpoon')

local fzf_helpers = require('plugins.fzf-lua.helpers')
local repl = require('repl')
local run_file = require('run_file')

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local function nmap(lhs, rhs, desc)
  map('n', lhs, rhs, desc)
end

local function vmap(lhs, rhs, desc)
  map('v', lhs, rhs, desc)
end

local function xmap(lhs, rhs, desc)
  map('x', lhs, rhs, desc)
end

map('i', 'jk', '<esc>')
map('t', '<esc>', '<c-\\><c-n>')
nmap('-', '<cmd>Oil<cr>', 'file-drawer')
nmap('<c-t>', ':tabnew<cr>')
nmap('<c-w>m', '<c-w>|<c-w>_')
nmap('<down>', '<c-w>-')
nmap('<left>', '1<c-w>>')
nmap('<right>', '1<c-w><')
nmap('<up>', '<c-w>+')
nmap('[d', vim.diagnostic.goto_prev, 'diagnostic-prev')
nmap(']d', vim.diagnostic.goto_next, 'diagnostic-next')
nmap('gp', '`[v`]')
nmap('j', 'gj')
nmap('k', 'gk')
vim.keymap.set('n', ';', ':', { noremap = true })
vmap('J', ":m '>+1<cr>gv=gv")
vmap('K', ":m '<-2<cr>gv=gv")

nmap('K', function()
  vim.cmd([[
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  ]])
end)

local yank_copy_command = vim.fn
  .trim(vim.fn.system('uname -a'))
  :match('microsoft') and 'clip.exe' or 'pbcopy'

vmap('<c-c>', function()
  local l = vim.fn.line('.')
  local c = vim.fn.col('.')

  vim.cmd('normal! "+y')
  vim.fn.system(yank_copy_command, vim.fn.getreg('"'))
  vim.fn.cursor(l, c)
end)

local function tab_control(tab_cmd, buf_cmd)
  if vim.fn.tabpagenr('$') > 1 then
    vim.cmd(tab_cmd)
  else
    vim.cmd(buf_cmd)
  end
end

nmap('H', function()
  tab_control('tabp', 'bp')
end)

nmap('L', function()
  tab_control('tabn', 'bn')
end)

-- leader
nmap('<leader>b-', ':%bd|e#|bd#<cr>', 'delete-inactive-buffers')
nmap('<leader>q', ':noh<cr>', 'no-highlight')
nmap('<leader>tc', repl.run, 'repl')
nmap('<leader>tf', ':TestFile<cr>', 'test-file')
nmap('<leader>tn', ':TestNearest<cr>', 'test-near')
nmap('<leader>tr', run_file.run, 'run')
vmap('<leader>s', ':sort<cr>', 'sort')

--- ai
nmap('<leader>aa', function()
  require('sidekick').nes_jump_or_apply()
end, 'suggestion-jump-or-apply')

nmap('<leader>af', function()
  require('sidekick.cli').send({ msg = '{file}' })
end, 'send-file')

nmap('<leader>ai', function()
  require('sidekick.cli').toggle()
end, 'toggle-ai-cli')

map({ 'n', 'x' }, '<leader>ap', function()
  require('sidekick.cli').prompt()
end, 'select-prompt')

map({ 'n', 'x' }, '<leader>at', function()
  require('sidekick.cli').send({ msg = '{this}' })
end, 'send-this')

xmap('<leader>av', function()
  require('sidekick.cli').send({ msg = '{selection}' })
end, 'send-selection-to-ai')

--- dap
nmap('<leader>db', dap.toggle_breakpoint, 'toggle-breakpoint')
nmap('<leader>dc', dap.continue, 'continue')
nmap('<leader>dd', dap.disconnect, 'disconnect')
nmap('<leader>dr', dap.repl.toggle, 'repl-toggle')

--- fzf
nmap('<c-p>', fzf.files)
nmap('<leader>fg', fzf.grep, 'fzf-live-grep')
nmap('<leader>fw', fzf.grep_cword, 'fzf-grep-string')
nmap('<leader>gs', fzf.git_status, 'fzf-git-status')
nmap('<leader>ldl', fzf.diagnostics_workspace, 'fzf-diagnostic-list')
nmap('\\', fzf.buffers)

--- git
local function diff_command(original, custom)
  return function()
    if vim.api.nvim_get_option_value('diff', {}) then
      vim.api.nvim_feedkeys('n', original, true)
    else
      custom()
    end
  end
end

map({ 'n', 'v' }, '<leader>go', ':GBrowse<cr>', 'open-browser')
nmap('<leader>gb', ':Git blame<cr>', 'blame')
nmap('<leader>gc', gitsigns.preview_hunk, 'preview-hunk')
nmap('<leader>gu', gitsigns.undo_stage_hunk, 'undo-stage-hunk')
nmap('[c', diff_command('[c', gitsigns.prev_hunk))
nmap(']c', diff_command(']c', gitsigns.next_hunk))

nmap('<leader>ga', gitsigns.stage_hunk, 'stage-hunk')
vmap('<leader>ga', function()
  gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, 'stage-hunk')

nmap('<leader>gr', gitsigns.reset_hunk, 'reset-hunk')
vmap('<leader>gr', function()
  gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, 'reset-hunk')

--- harpoon
nmap('<leader>ha', function()
  harpoon:list():add()
end, 'harpoon-add')

nmap('<leader>hd', function()
  harpoon:list():remove()
end, 'harpoon-remove')

nmap('<leader>hl', fzf_helpers.harpoon_list, 'harpoon-list')

-- leap
map({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', 'leap')
nmap('S', '<Plug>(leap-from-window)', 'leap-from-window')
