--- @type vim.lsp.Config
return {
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },

    yaml = {
      validate = true,

      format = {
        enable = true,
      },

      schemaStore = {
        enable = false,
        url = '',
      },

      schemas = require('schemastore').yaml.schemas(),
    },
  },
}
