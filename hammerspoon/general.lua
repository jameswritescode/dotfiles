hs.hotkey.bind(hyper, '\\', function()
  hs.caffeinate.lockScreen()
end)

-- Rebind hyper+hjkl to arrow keys
local function keyCode(key)
  return function()
    hs.eventtap.event.newKeyEvent({}, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent({}, string.lower(key), false):post()
  end
end

hs.hotkey.bind(hyper, 'h', keyCode('left'), nil, keyCode('left'))
hs.hotkey.bind(hyper, 'j', keyCode('down'), nil, keyCode('down'))
hs.hotkey.bind(hyper, 'k', keyCode('up'), nil, keyCode('up'))
hs.hotkey.bind(hyper, 'l', keyCode('right'), nil, keyCode('right'))
