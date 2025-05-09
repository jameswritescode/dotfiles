vim.g.mapleader = ' '

vim.o.autowrite = true
vim.o.breakindent = true
vim.o.cmdheight = 1
vim.o.colorcolumn = '+1'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.concealcursor = 'niv'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.exrc = true
vim.o.foldenable = false
vim.o.gdefault = true
vim.o.inccommand = 'split'
vim.o.laststatus = 3
vim.o.linebreak = true
vim.o.number = true
vim.o.showmode = false
vim.o.signcolumn = 'auto:1-2'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.textwidth = 79
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.visualbell = true
vim.o.winborder = 'rounded'

vim.opt.diffopt:append('vertical')
vim.opt.shortmess:append('c')
vim.opt.tags:prepend('./.git/tags;')
vim.opt.wildignore:append({ '.DS_Store', '*.pyc' })

vim.o.list = true
vim.opt.listchars = {
  nbsp = '·',
  tab = '¦ ',
  trail = '·',
  extends = '>',
  precedes = '<',
}

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.netrw_localrmdir = 'rm -r'
