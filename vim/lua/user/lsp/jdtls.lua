local common = require('user.lsp.common')

local root_dir = require('lspconfig.server_configurations.jdtls').default_config.root_dir

local config = {
  on_attach = common.on_attach,
  root_dir = root_dir,
}

require('jdtls').start_or_attach(config)
