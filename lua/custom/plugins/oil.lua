return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["q"] = "actions.close",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>lua require('oil').open_float()<cr>", desc = "Oil" },
  },
}
