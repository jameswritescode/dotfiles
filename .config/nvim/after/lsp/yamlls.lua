--- @type vim.lsp.Config
return {
  -- Does this work anymore?
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas = vim.tbl_deep_extend(
      'force',
      new_config.settings.yaml.schemas or {},
      require('schemastore').yaml.schemas()
    )
  end,

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
    },
  },
}
