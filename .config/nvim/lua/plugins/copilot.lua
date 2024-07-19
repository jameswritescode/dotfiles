local copilot = require('copilot')

local function copilot_signed_in()
  return pcall(function()
    copilot.auth.get_cred()
  end)
end

local function setup()
  copilot.setup({
    panel = { enabled = false },
    suggestion = { enabled = false },
  })
end

return {
  copilot_signed_in = copilot_signed_in,
  setup = setup,
}
