vim.filetype.add({
  filename = {
    ['Brewfile'] = 'ruby',
    ['Guardfile'] = 'ruby',
    ['kitty.conf'] = 'kitty',
  },

  pattern = {
    ['*.ejson'] = 'json',
    ['*.rbi'] = 'ruby',
  },
})
