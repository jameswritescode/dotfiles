require('vim._core.ui2').enable({
  enable = true,
  msg = {
    target = 'cmd',

    cmd = {
      height = 0.5,
    },

    dialog = {
      height = 0.5,
    },

    msg = {
      height = 0.3,
      timeout = 5000,
    },

    pager = {
      height = 0.5,
    },
  },
})
