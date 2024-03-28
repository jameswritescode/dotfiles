local clients = {}

local function create_client(client_id)
  if not clients[client_id] then
    clients[client_id] = {
      buffers = {},
      tokens = {},
    }
  end
end

local function process_event(event)
  vim.print(event)
  local data = event.data

  create_client(data.client_id)

  local value = data.result.value

  if value.kind == 'begin' then
    clients[data.client_id].tokens[data.result.token] = {
      message = value.message,
      percentage = value.percentage,
      state = 'starting',
      title = value.title,
    }
  elseif value.kind == 'report' then
    clients[data.client_id].tokens[data.result.token] = {
      message = value.message,
      percentage = value.percentage,
      state = 'pending',
    }
  elseif value.kind == 'end' then
    clients[data.client_id].tokens[data.result.token] = {
      message = value.message,
      state = 'finished',
    }
  end
end

local function attach_client(event)
  local client_id = event.data.client_id

  create_client(client_id)

  clients[client_id].buffers[event.buf] = true
end

local function detach_client(event)
  clients[event.data.client_id] = nil
end

local function register_autocmds()
  local group = vim.api.nvim_create_augroup('UserLspStatusTracking', { clear = true })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = attach_client,
    group = group,
  })

  vim.api.nvim_create_autocmd('LspDetach', {
    callback = detach_client,
    group = group,
  })

  vim.api.nvim_create_autocmd('LspProgress', {
    callback = process_event,
    group = group,
  })
end

local function buffer_status(bufnr)
  for _, client in pairs(clients) do
    if client.buffers[bufnr] then
      for _, token in pairs(client.tokens) do
        if token.state then return token.state end
      end
    end
  end

  return false
end

local M = {
  buffer_status = buffer_status,
  clients = clients,
  register_autocmds = register_autocmds,
}

return M
