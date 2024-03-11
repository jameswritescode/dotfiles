local root_dir = require('lspconfig.server_configurations.jdtls').default_config.root_dir

local config = {
  root_dir = root_dir,
}

require('jdtls').start_or_attach(config)
