local copilot_chat_actions = require('CopilotChat.actions')
local copilot_chat_fzf = require('CopilotChat.integrations.fzflua')
local fzf = require('fzf-lua')

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local function nmap(lhs, rhs, desc)
  map('n', lhs, rhs, desc)
end

nmap('<c-p>', fzf.files)
nmap('\\', fzf.buffers)

nmap('<leader>ai', '<cmd>CopilotChatToggle<cr>', 'copilot-chat-toggle')

--- copilot
if require('user.functions').copilot_signed_in() then
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

nmap('<leader>fg', fzf.grep, 'fzf-live-grep')
nmap('<leader>fw', fzf.grep_cword, 'fzf-grep-string')
nmap('<leader>gs', fzf.git_status, 'fzf-git-status')
nmap('<leader>ldl', fzf.diagnostics_workspace, 'fzf-diagnostic-list')
