local fzf = require('fzf-lua')

local function nmap(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

nmap('<c-p>', fzf.files)
nmap('\\', fzf.buffers)

nmap('<leader>fg', fzf.grep, 'fzf-live-grep')
nmap('<leader>fw', fzf.grep_cword, 'fzf-grep-string')
nmap('<leader>gs', fzf.git_status, 'fzf-git-status')
nmap('<leader>ldl', fzf.diagnostics_workspace, 'fzf-diagnostic-list')
