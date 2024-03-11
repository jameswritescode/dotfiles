local cmp = require 'cmp'

local common = {}

common.window_opts = cmp.config.window.bordered()

function common.set_winhighlight(winnr)
  if not winnr then return end

  vim.wo[winnr].winhl = common.window_opts.winhighlight
end

return common
