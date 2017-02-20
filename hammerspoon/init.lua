local function keyCode(key)
  return function()
    hs.eventtap.event.newKeyEvent({}, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent({}, string.lower(key), false):post()
  end
end

hs.hotkey.bind({'ctrl', 'cmd'}, 'h', keyCode('left'), nil, keyCode('left'))
hs.hotkey.bind({'ctrl', 'cmd'}, 'j', keyCode('down'), nil, keyCode('down'))
hs.hotkey.bind({'ctrl', 'cmd'}, 'k', keyCode('up'), nil, keyCode('up'))
hs.hotkey.bind({'ctrl', 'cmd'}, 'l', keyCode('right'), nil, keyCode('right'))
