return {
  { "sainnhe/edge" },
  { "sainnhe/everforest" },
  { "sainnhe/gruvbox-material" },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- transparent = true,
      compile = true,
    },
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
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
}
