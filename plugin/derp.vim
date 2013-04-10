" File: derp.vim
" Author: James Newton <james@Zaphyous.com>
" Description: post to derp.us with vim
" Last Modified: April 06, 2013

if (exists("g:loaded_derp") && g:loaded_derp) || &cp
    finish
endif

let g:loaded_derp = 1
let g:derp_file_type = expand('%')

if has("python")
    command! -range=% DerpPost python mkreq(<line1>, <line2>)
else
    command! DerpPost echo "Only avaliable with +python support."
endif

if has("python")
python <<EOF

import vim
from urllib import urlencode, urlopen

__version__ = "1.0"

def mkreq(line1, line2):
    #buffer = "\n".join(vim.current.buffer[line1:line2])

    buffer = vim.eval('join(getline(' + str(line1) + ',' + str(line2) + '), "\n")')

    data = [("f:1", buffer), ("type:1", vim.eval("&filetype"))]

    if vim.eval('g:derp_file_type') != None:
        data.append(('name:1', vim.eval('g:derp_file_type')))

    data = urlencode(data);
    res = urlopen("http://derp.us/", data).read().strip()
    vim.command("py print '" + res + "'")

EOF
endif
