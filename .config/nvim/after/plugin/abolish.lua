if not vim.g.loaded_abolish then
  return
end

-- General
vim.cmd([[
  Abolish boostrap bootstrap
  Abolish {,have_}recieve{,d} {}receive{}
  Abolish precense presence
  Abolish converastion{,_id} conversation{}
  Abolish {,buyer_}ideneity {}identity
  Abolish materailize{,d} materialize{}
]])

-- Rails
vim.cmd([[
  Abolish destory{,_all} destroy{}
  Abolish {,update_}attribite{,s} {}attribute{}
]])
