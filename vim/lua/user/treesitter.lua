require'nvim-treesitter.configs'.setup {
  endwise = {
    enable = true,
  },

  ensure_installed = {
    "bash",
    "comment",
    "css",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "ruby",
    "rust",
    "toml",
    "typescript",
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
    enable = false,
  },

  matchup = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
      },
    },
  },
}
