vim.filetype.add({
  extension = {
    ejson = 'json',
    rbi = 'ruby',
  },

  filename = {
    ['Brewfile'] = 'ruby',
    ['Guardfile'] = 'ruby',
    ['kitty.conf'] = 'kitty',
  },
})
