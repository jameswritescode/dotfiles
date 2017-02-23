function gethostname()
  local f = io.popen('/bin/hostname')
  local hostname = f:read('*a')

  f:close()

  return string.gsub(hostname, '\n$', '')
end

local screens = {}
screens['James-Newton-MBP-475.local'] = { 'Color LCD', 'DELL P2715Q' }

local currentScreen = screens[gethostname()]

function minFrame(screen)
end

local pressed = {
  up = false,
  down = false,
  left = false,
  right = false
}

hs.hotkey.bind(hyper, 'w', function()
  pressed.up = true
end, function()
  pressed.up = false
end)

hs.hotkey.bind(hyper, 'a', function()
  pressed.left = true
end, function()
  pressed.left = false
end)

hs.hotkey.bind(hyper, 's', function()
  pressed.down = true
end, function()
  pressed.down = false
end)

hs.hotkey.bind(hyper, 'd', function()
  pressed.right = true
end, function()
  pressed.right = false
end)
