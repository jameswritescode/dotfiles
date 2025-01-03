local cwd = vim.fn.getcwd()

local function remove_cwd(item)
  return item:sub(#cwd + 2)
end

local function build_packwerk_config()
  local identifier = 'package.yml'
  local glob = vim.glob.to_lpeg(cwd .. '/components/**/' .. identifier)

  local packages = vim.fs.find(function(name, path)
    local matches = glob:match(path .. '/' .. name)
    local depth = #vim.split(remove_cwd(path), '/')

    -- Anything else is emotional terrorism.
    -- components/a
    -- components/a/b
    local within_max_depth = depth > 1 and depth < 4

    return matches and within_max_depth
  end, { limit = math.huge, type = 'file' })

  local directories = vim.tbl_map(function(item)
    local path = remove_cwd(item)

    return path:sub(1, -#identifier - 1)
  end, packages)

  local config = {}

  -- h/t @bartzon
  for _, directory in pairs(directories) do
    config[directory .. 'app/*.rb'] = {
      type = 'source',
      alternate = {
        directory .. 'test/unit/{}_test.rb',
        directory .. 'test/{}_test.rb',
      },
    }

    config[directory .. 'app/models/*.rb'] = {
      type = 'model',
      alternate = {
        directory .. 'test/unit/{}_test.rb',
        directory .. 'test/{}_test.rb',
      },
    }

    config[directory .. 'test/unit/*_test.rb'] = {
      type = 'test',
      alternate = {
        directory .. 'app/models/{}.rb',
        directory .. 'app/{}.rb',
      },
    }

    config[directory .. 'test/*_test.rb'] = {
      type = 'test',
      alternate = directory .. 'app/{}.rb',
    }
  end

  return config
end

return {
  'tpope/vim-rails',
  dependencies = { 'tpope/vim-projectionist' },
  config = function()
    if vim.fn.filereadable('packwerk.yml') ~= 0 then
      vim.g.rails_projections = build_packwerk_config()
    end
  end,
}
