local gitsigns = require('gitsigns')

gitsigns.setup({
  signs = {
    add = { text = '┃' },
    change = { text = '┃' },
    changedelete = { text = '◢' },
    delete = { text = '◢' },
    topdelete = { text = '◥' },
    untracked = { text = '┋' },
  },
})
