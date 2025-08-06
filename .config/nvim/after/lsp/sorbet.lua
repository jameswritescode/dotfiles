local util = require('lspconfig.util')

--- @type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root_pattern = util.root_pattern('sorbet')(fname)

    if root_pattern then
      on_dir(root_pattern)
    end
  end,
}
