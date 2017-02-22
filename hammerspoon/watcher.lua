-- From https://github.com/miromannino/miro-windows-management/
function reload_config(files)
  hs.reload()
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload_config):start()
hs.alert.show("Configuration loaded")
