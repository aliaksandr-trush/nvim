return {
  {
    'webhooked/kanso.nvim',
    enabled = false,
    -- lazy = false,
    event = 'VeryLazy',
    priority = 1000,
  },
  {
    'rebelot/kanagawa.nvim',
    -- "aliaksandr-trush/kanagawa.nvim",
    dev = true,
    priority = 1000,
    lazy = false,
    build = ':KanagawaCompile',
    opts = {
      -- transparent = true,
      -- compile = true,
      dimInactive = true,
    },
  },
  {
    'folke/tokyonight.nvim',
    -- lazy = false,
    enabled = false,
    event = 'VeryLazy',
    opts = {},
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    event = 'VeryLazy',
    opts = {
      -- transparent_background = true,
      integrations = {
        notify = true,
        rainbow_delimiters = true,
        indent_blankline = {
          colored_indent_levels = true,
        },
      },
    },
  },
}
