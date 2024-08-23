require('nvim-treesitter.configs').setup({
  autotag = {
    enable = true,
  },

  endwise = {
    enable = true,
  },

  ensure_installed = {
    'bash',
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
