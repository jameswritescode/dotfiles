hs.window.animationDuration = 0

hs.grid.setGrid('24x24')
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

local function set_screen(cb)
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  local cell = hs.grid.get(win, screen)

  cell.x = 0
  cell.y = 0

  cb(cell)

  hs.grid.set(win, cell, win:screen())
end

-- +-----------------+
-- |      HERE       |
-- +-----------------+
-- |                 |
-- +-----------------+
hs.hotkey.bind(hyper, 'w', function()
  set_screen(function(cell)
    cell.w = 24
    cell.h = 12
  end)
end)

-- +--------+--------+
-- |        |        |
-- |  HERE  |        |
-- |        |        |
-- +--------+--------+
hs.hotkey.bind(hyper, 'a', function()
  set_screen(function(cell)
    cell.w = 12
    cell.h = 24
  end)
end)

-- +-----------------+
-- |                 |
-- +-----------------+
-- |      HERE       |
-- +-----------------+
hs.hotkey.bind(hyper, 'x', function()
  set_screen(function(cell)
    cell.y = 12
    cell.w = 24
    cell.h = 12
  end)
end)

-- +--------+--------+
-- |        |        |
-- |        |  HERE  |
-- |        |        |
-- +--------+--------+
hs.hotkey.bind(hyper, 'd', function()
  set_screen(function(cell)
    cell.x = 12
    cell.w = 12
    cell.h = 24
  end)
end)

-- +--------+--------+
-- |                 |
-- |      HERE       |
-- |                 |
-- +--------+--------+
hs.hotkey.bind(hyper, 'f', function()
  set_screen(function(cell)
    cell.w = 24
    cell.h = 24
  end)
end)

hs.hotkey.bind(hyper, 'q', function()
  set_screen(function(cell)
    cell.w = 12
    cell.h = 12
  end)
end)

hs.hotkey.bind(hyper, 'e', function()
  set_screen(function(cell)
    cell.x = 12
    cell.w = 12
    cell.h = 12
  end)
end)

hs.hotkey.bind(hyper, 'z', function()
  set_screen(function(cell)
    cell.y = 12
    cell.w = 12
    cell.h = 12
  end)
end)

hs.hotkey.bind(hyper, 'c', function()
  set_screen(function(cell)
    cell.y = 12
    cell.x = 12
    cell.w = 12
    cell.h = 12
  end)
end)

hs.hotkey.bind(hyper, 's', function()
  set_screen(function(cell)
    cell.y = 6
    cell.x = 6
    cell.w = 12
    cell.h = 12
  end)
end)

-- hs.hotkey.bind(hyper, 'i', function()
--   local win = hs.window.frontmostWindow()
--   local screen = win:screen()
--   local cell = hs.grid.get(win, screen)

--   hs.alert.show(cell)
-- end)
