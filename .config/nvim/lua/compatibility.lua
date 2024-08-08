local function compatibility_override(version, name, fn)
  if vim.version.gt(vim.version(), version) then
    vim.notify(
      'Compatibility removal available for ' .. name,
      vim.log.levels.WARN
    )
  else
    fn()
  end
end

compatibility_override('0.12', 'vim.lsp.get_active_clients', function()
  vim.lsp.get_active_clients = vim.lsp.get_clients
end)

compatibility_override('0.13', 'vim.diagnostic.goto_* overrides', function()
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.diagnostic.goto_next = function()
    vim.diagnostic.jump({ count = 1, float = true })
  end

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.diagnostic.goto_prev = function()
    vim.diagnostic.jump({ count = -1, float = true })
  end
end)
