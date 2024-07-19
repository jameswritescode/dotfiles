-- TODO: Remove this after 0.12
if vim.lsp.get_clients then
  vim.lsp.get_active_clients = vim.lsp.get_clients
end

-- TODO: Remove after 0.13
if vim.diagnostic.jump then
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.diagnostic.goto_next = function()
    vim.diagnostic.jump({ count = 1, float = true })
  end

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.diagnostic.goto_prev = function()
    vim.diagnostic.jump({ count = -1, float = true })
  end
end
