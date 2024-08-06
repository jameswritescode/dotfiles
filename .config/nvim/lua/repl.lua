local cmds = {
  elixir = 'iex -S mix',
  python = 'python3',
  ruby = 'rails console',
}

local function run()
  local ft = vim.bo.filetype
  local cmd = cmds[ft]

  if cmd then
    vim.cmd('split | terminal ' .. cmd)
  else
    vim.notify('No repl configured for ' .. ft)
  end
end

return {
  run = run,
}
