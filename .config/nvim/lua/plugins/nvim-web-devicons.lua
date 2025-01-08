return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    local devicons = require('nvim-web-devicons')
    local icons = devicons.get_icons()

    local ruby_types = {
      'brewfile',
      'config.ru',
      'erb',
      'gemspec',
      'rake',
      'rakefile',
      'rb',

      -- One or both of these have issues on different computers.
      'gemfile$',
      'gemfile',
    }

    for _, n in pairs(ruby_types) do
      if icons[n] then
        icons[n].color = '#cc342d'
      end
    end

    devicons.setup()
  end,
}
