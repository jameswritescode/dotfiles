--- @type vim.lsp.Config
return {
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        allFeatures = true,
        command = 'clippy',
        extraArgs = { '--no-deps' },
      },
    },
  },
}
