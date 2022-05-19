if has('nvim')
  lua <<EOF
  require'nvim-treesitter.configs'.setup {
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
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

    hidesig = {
      enable = true,
      delay = 200,
      opacity = 0.75,
    },
  }
EOF
end
