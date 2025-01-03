local blink = require('blink.cmp.config.completion.documentation')

local common = {}

common.window_opts =
  vim.tbl_extend('force', blink.default.window, { border = 'rounded' })

function common.set_winhighlight(winnr)
  if not winnr then
    return
  end

  vim.wo[winnr].winhl = common.window_opts.winhighlight
end

return common
