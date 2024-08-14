local function build_packwerk_config()
  local config = {}

  if not vim.fn.filereadable('packwerk.yml') then
    return config
  end

  local apps = vim.tbl_filter(function(item)
    if not vim.startswith(item, 'component') then
      return false
    end

    -- Anything else is emotional terrorism.
    -- components/a/app
    -- components/a/b/app
    return #vim.split(item, '/') < 5
  end, vim.split(vim.fn.glob('**/app'), '\n'))

  local components = vim.tbl_map(function(item)
    return vim.fn.trim(item, 'app', 2)
  end, apps)

  -- h/t @bartzon
  for _, component in pairs(components) do
    config[component .. 'app/*.rb'] = {
      type = 'source',
      alternate = {
        component .. 'test/unit/{}_test.rb',
        component .. 'test/{}_test.rb',
      },
    }

    config[component .. 'app/models/*.rb'] = {
      type = 'model',
      alternate = {
        component .. 'test/unit/{}_test.rb',
        component .. 'test/{}_test.rb',
      },
    }

    config[component .. 'test/unit/*_test.rb'] = {
      type = 'test',
      alternate = {
        component .. 'app/models/{}.rb',
        component .. 'app/{}.rb',
      },
    }

    config[component .. 'test/*_test.rb'] = {
      type = 'test',
      alternate = component .. 'app/{}.rb',
    }
  end

  return { ['Gemfile'] = config }
end

vim.g.projectionist_heuristics = build_packwerk_config()
