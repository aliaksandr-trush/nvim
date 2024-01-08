return {
  { "sainnhe/edge" },
  { "sainnhe/everforest" },
  { "sainnhe/gruvbox-material" },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },
  { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      -- transparent_background = true,
      integrations = {
        notify = true,
      }
    },
  },
}
