--# selene: allow(mixed_table)

local fzf = require('fzf-lua')
local harpoon = require('harpoon')

local function setup()
  fzf.setup({
    'telescope',
    file_ignore_patterns = { '%.rbi' },
  })

  fzf.register_ui_select()
end

local function harpoon_list()
  fzf.fzf_exec(function(fzf_cb)
    for _, item in ipairs(harpoon:list().items) do
      fzf_cb(item.value)
    end

    fzf_cb()
  end, {
    previewer = 'builtin',

    actions = {
      ['default'] = require('fzf-lua').actions.file_edit,
    },
  })
end

return {
  harpoon_list = harpoon_list,
  setup = setup,
}
