local function echo(msg)
  print(vim.inspect(msg))
end

function jump()
end

function jump_to_location(location)
end

function fzf(source, label, bool1, bool2)
end

local function handler(err, result, ctx, config)
  local references = vim.tbl_islist(result) and result or {result}

  if #result == 1 then
    return jump_to_location(references[1])
  end

  local items = vim.lsp.util.locations_to_items(references)
  local source = vim.tbl_map(function(entry) return entry end, items)

  fzf(source, 'References', true, true)
end


return { handler = handler }
