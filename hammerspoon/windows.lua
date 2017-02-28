hs.window.animationDuration = 0.3

hs.grid.setGrid('24x24')
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

local pressed = {
  up = false,
  down = false,
  left = false,
  right = false
}

function setScreen(cb)
  local win = hs.window.frontmostWindow()
  local screen = win:screen()
  local cell = hs.grid.get(win, screen)

  cb(cell)

  hs.grid.set(win, cell, win:screen())
end

hs.hotkey.bind(hyper, 'w', function()
  pressed.up = true

  setScreen(function(cell)
    cell.x = 0
    cell.y = 0
    cell.w = 24
    cell.h = 12
  end)
end, function()
  pressed.up = false
end)

hs.hotkey.bind(hyper, 'a', function()
  pressed.left = true

  setScreen(function(cell)
    cell.x = 0
    cell.y = 0
    cell.w = 12
    cell.h = 24
  end)
end, function()
  pressed.left = false
end)

hs.hotkey.bind(hyper, 's', function()
  pressed.down = true

  setScreen(function(cell)
    cell.x = 0
    cell.y = 12
    cell.w = 24
    cell.h = 12
  end)
end, function()
  pressed.down = false
end)

hs.hotkey.bind(hyper, 'd', function()
  pressed.right = true

  setScreen(function(cell)
    cell.x = 12
    cell.y = 0
    cell.w = 12
    cell.h = 24
  end)
end, function()
  pressed.right = false
end)

hs.hotkey.bind(hyper, 'f', function()
  setScreen(function(cell)
    cell.x = 0
    cell.y = 0
    cell.w = 24
    cell.h = 24
  end)
end)
