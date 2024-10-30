vim.filetype.add({
  extension = {
    ejson = 'json',
    rbi = 'ruby',
    tpl = 'helm',
  },

  filename = {
    ['Brewfile'] = 'ruby',
    ['Guardfile'] = 'ruby',
    ['kitty.conf'] = 'kitty',
  },
})
