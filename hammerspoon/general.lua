hs.hotkey.bind(hyper, 'r', function()
  hs.reload()
end)

hs.hotkey.bind(hyper, '\\', function()
  hs.caffeinate.lockScreen()
end)

hs.hotkey.bind(hyper, 'i', function()
  hs.application.find('iterm'):activate()
end)

-- Rebind hyper+hjkl to arrow keys
local function key_code(key)
  return function()
    hs.eventtap.event.newKeyEvent({}, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent({}, string.lower(key), false):post()
  end
end

hs.hotkey.bind(hyper, 'h', key_code('left'), nil, key_code('left'))
hs.hotkey.bind(hyper, 'j', key_code('down'), nil, key_code('down'))
hs.hotkey.bind(hyper, 'k', key_code('up'), nil, key_code('up'))
hs.hotkey.bind(hyper, 'l', key_code('right'), nil, key_code('right'))
