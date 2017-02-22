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
