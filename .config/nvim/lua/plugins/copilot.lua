local function copilot_signed_in()
  return pcall(function()
    require('copilot.auth').get_cred()
  end)
end

local function plugin_setup()
  require('copilot').setup({
    panel = { enabled = false },
    suggestion = { enabled = false },
  })
end

return {
  copilot_signed_in = copilot_signed_in,
  plugin_setup = plugin_setup,
}
