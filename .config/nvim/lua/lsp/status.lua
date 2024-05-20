local clients = {}

local function create_client(client_id)
  local client = vim.lsp.get_client_by_id(client_id)

  if client and client.name == 'copilot' then return false end

  if not clients[client_id] then
    clients[client_id] = {
      buffers = {},
      tokens = {},
    }
  end

  return true
end

local function process_event(event)
  local data = event.data

  if not create_client(data.client_id) then return end

  local value = data.params.value

  if value.kind == 'begin' then
    clients[data.client_id].tokens[data.params.token] = {
      message = value.message,
      percentage = value.percentage,
      state = 'started',
      title = value.title,
    }
  elseif value.kind == 'report' then
    clients[data.client_id].tokens[data.params.token] = {
      message = value.message,
      percentage = value.percentage,
      state = 'pending',
    }
  elseif value.kind == 'end' then
    clients[data.client_id].tokens[data.params.token] = {
      message = value.message,
      state = 'finished',
    }
  end
end

local function attach_client(event)
  local client_id = event.data.client_id

  if not create_client(client_id) then return end

  if not vim.list_contains(clients[client_id].buffers, event.buf) then
    table.insert(clients[client_id].buffers, event.buf)
  end
end

local function detach_client(event)
  clients[event.data.client_id] = nil
end

local function redraw_after(fn)
  return function(event)
    fn(event)
    vim.api.nvim_command('redrawstatus')
  end
end

local function register_autocmds()
  local group = vim.api.nvim_create_augroup('UserLspStatusTracking', { clear = true })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = redraw_after(attach_client),
    group = group,
  })

  vim.api.nvim_create_autocmd('LspDetach', {
    callback = redraw_after(detach_client),
    group = group,
  })

  vim.api.nvim_create_autocmd('LspProgress', {
    callback = redraw_after(process_event),
    group = group,
  })
end

local function buffer_status(bufnr)
  local has_lsp = false

  for _, client in pairs(clients) do
    if vim.list_contains(client.buffers, bufnr) then
      has_lsp = true

      for _, token in pairs(client.tokens) do
        if token.state ~= 'finished' then return false end
      end
    end
  end

  return has_lsp or nil
end

return {
  buffer_status = buffer_status,
  clients = clients,
  register_autocmds = register_autocmds,
}
