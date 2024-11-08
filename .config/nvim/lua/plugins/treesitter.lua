local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.blade = {
  filetype = 'blade',

  install_info = {
    branch = 'main',
    files = { 'src/parser.c' },
    url = 'https://github.com/EmranMR/tree-sitter-blade',
  },
}

require('nvim-treesitter.configs').setup({
  autotag = {
    enable = true,
  },

  endwise = {
    enable = false,
  },

  ensure_installed = {
    'bash',
    'blade',
    'comment',
    'css',
    'go',
    'graphql',
    'html',
    'http',
    'java',
    'javascript',
    'json',
    'kotlin',
    'lua',
    'markdown',
    'markdown_inline',
    'php',
    'query',
    'ruby',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vimdoc',
  },

  hidesig = {
    enable = true,
    delay = 200,
    opacity = 0.75,
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  matchup = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ap'] = '@parameter.outer',
        ['ip'] = '@parameter.inner',
      },
    },
  },
})
