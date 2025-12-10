return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- opts = {
  --     latex = { enabled = false },
  -- -- },
  -- enabled = false,
  -- "OXY2DEV/markview.nvim",
  -- lazy = false,
  event = { 'BufRead', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
