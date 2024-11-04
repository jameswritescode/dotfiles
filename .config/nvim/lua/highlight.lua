local theme = require('catppuccin.palettes.mocha')

local highlights = {
  NormalFloat = { fg = theme.text, bg = theme.none },
}

for name, config in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, config)
end
