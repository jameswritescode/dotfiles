local function copilot_signed_in()
  return pcall(function()
    require('copilot.auth').get_cred()
  end)
end

return {
  copilot_signed_in = copilot_signed_in,
}
