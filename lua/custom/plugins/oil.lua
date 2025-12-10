return {
  'stevearc/oil.nvim',
  lazy = false,
  dev = true,
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["q"] = "actions.close",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-d>"] = {
        function ()
          require("oil").select({diff = true})
        end,
        mode = "n",
        desc = "Diff file",
      },
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- { "-", "<cmd>lua require('oil').open_float()<cr>", desc = "Oil" },
    { "-", function()
            require('oil').open_float(nil, {preview = { split = "belowright" }})
        end, desc = "Oil" },
  },
}
