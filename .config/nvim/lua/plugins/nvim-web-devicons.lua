return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    local devicons = require('nvim-web-devicons')
    local icons = devicons.get_icons()

    local ruby_types = {
      'brewfile',
      'config.ru',
      'erb',
      'gemfile',
      'gemspec',
      'rake',
      'rakefile',
      'rb',
    }

    for _, n in pairs(ruby_types) do
      icons[n].color = '#cc342d'
    end

    devicons.setup()
  end,
}
