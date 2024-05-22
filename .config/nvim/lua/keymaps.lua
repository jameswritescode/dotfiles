local dap = require('dap')
local fzf = require('fzf-lua')
local gitsigns = require('gitsigns')

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local function nmap(lhs, rhs, desc)
  map('n', lhs, rhs, desc)
end

local function vmap(lhs, rhs, desc)
  map('v', lhs, rhs, desc)
end

map('i', 'jk', '<esc>')
map('t', '<esc>', '<c-\\><c-n>')
nmap('<c-t>', ':tabnew<cr>')
nmap('<c-w>m ', ':wincmd _<bar>wincmd <bar><cr>')
nmap('<down>', '<c-w>-')
nmap('<left>', '1<c-w>>')
nmap('<right>', '1<c-w><')
nmap('<up>', '<c-w>+')
nmap('H', ':call TabControl("tabp", "bp")<cr>')
nmap('L', ':call TabControl("tabn", "bn")<cr>')
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

-- leader
nmap('<leader>b-', ':%bd|e#|bd#<cr>', 'delete-inactive-buffers')
nmap('<leader>q', ':noh<cr>', 'no-highlight')
nmap('<leader>tc', ':call Repl()<cr>', 'repl')
nmap('<leader>tf', ':TestFile<cr>', 'test-file')
nmap('<leader>tn', ':TestNearest<cr>', 'test-near')
nmap('<leader>tr', ':call RunFile()<cr>', 'run')
nmap('[d', vim.diagnostic.goto_prev, 'diagnostic-prev')
nmap(']d', vim.diagnostic.goto_next, 'diagnostic-next')
vmap('<leader>s', ':sort<cr>', 'sort')

--- copilot
if require('functions').copilot_signed_in() then
  local copilot_chat_actions = require('CopilotChat.actions')
  local copilot_chat_fzf = require('CopilotChat.integrations.fzflua')

  nmap('<leader>ai', '<cmd>CopilotChatToggle<cr>', 'copilot-chat-toggle')

  map({ 'n', 'v' }, '<leader>ah', function()
    copilot_chat_fzf.pick(copilot_chat_actions.help_actions())
  end, 'copilot-chat-help')

  map({ 'n', 'v' }, '<leader>ap', function()
    copilot_chat_fzf.pick(copilot_chat_actions.prompt_actions())
  end, 'copilot-chat-prompts')
end

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
map({ 'n', 'v' }, '<leader>ga', gitsigns.stage_hunk, 'stage-hunk')
nmap('<leader>gb', ':Git blame<cr>', 'blame')
nmap('<leader>gc', gitsigns.preview_hunk, 'preview-hunk')
nmap('<leader>gu', gitsigns.reset_hunk, 'reset-hunk')
nmap('[c', diff_command('[c', gitsigns.prev_hunk))
nmap(']c', diff_command(']c', gitsigns.next_hunk))
