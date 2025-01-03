return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    integrations = {
      blink_cmp = true,
      dap = true,
      fzf = true,
      gitsigns = true,
      leap = true,
      mason = true,
      treesitter = true,
    },
    custom_highlights = function(colors)
      return {
        NormalFloat = { fg = colors.text, bg = colors.none },
        MsgArea = { fg = colors.overlay0 },

        BlinkCmpDocBorder = { fg = colors.blue },
        BlinkCmpMenu = { bg = colors.base },
        BlinkCmpMenuBorder = { bg = colors.base, fg = colors.blue },

        StatuslineFilename = { fg = colors.text, bg = colors.base },
        StatuslineGitAdd = { fg = colors.green, bg = colors.base },
        StatuslineGitChange = { fg = colors.yellow, bg = colors.base },
        StatuslineGitDelete = { fg = colors.red, bg = colors.base },
        StatuslineLspFinished = { fg = colors.green, bg = colors.base },
        StatuslineLspWorking = { fg = colors.yellow, bg = colors.base },
        StatuslineModeCommand = { fg = colors.teal, bg = colors.base },
        StatuslineModeInsert = { fg = colors.blue, bg = colors.base },
        StatuslineModeNormal = { fg = colors.green, bg = colors.base },
        StatuslineModeReplace = { fg = colors.red, bg = colors.base },
        StatuslineModeTerminal = { fg = colors.lavender, bg = colors.base },
        StatuslineModeUnknown = { fg = colors.subtext0, bg = colors.base },
        StatuslineModeVisual = { fg = colors.yellow, bg = colors.base },
        StatuslineSubtext = { fg = colors.subtext0, bg = colors.base },

        VimTestStatusFailed = { fg = colors.red },
        VimTestStatusPassed = { fg = colors.green },
        VimTestStatusRunning = { fg = colors.yellow },
        VimTestStatusUnknown = { fg = colors.blue },

        WinBar = { fg = colors.subtext0 },
        WinBarSep = { fg = colors.red },
      }
    end,
  },
  config = function(_plugin, opts)
    require('catppuccin').setup(opts)

    vim.cmd.colorscheme('catppuccin')
  end,
}
