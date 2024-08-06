local runners = {
  elixir = 'elixir',
  javascript = 'node',
  lua = 'lua',
  perl = 'perl',
  php = 'php',
  python = 'python',
  ruby = 'ruby',
  rust = 'cargo run',
  sh = 'sh',
  zsh = 'zsh',
}

local function run()
  local ft = vim.bo.filetype
  local cmd = runners[ft]

  if cmd then
    vim.cmd('vsplit | terminal ' .. cmd .. ' ' .. vim.fn.expand('%p'))
  else
    vim.notify('No runner configured for ' .. ft)
  end
end

return {
  run = run,
}
