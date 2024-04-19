if executable('jq')
  let &l:formatprg = 'jq . --indent ' . &shiftwidth
else
  setlocal formatprg=python\ -m\ json.tool
endif
