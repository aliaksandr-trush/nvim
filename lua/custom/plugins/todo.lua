return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        require("todo-comments").setup({
            highlight = {
                keyword = "bg",
            },
        })
        vim.keymap.set('n', '<leader>wt', '<cmd>TodoQuickFix<cr>', { desc = 'Workspace TODOs' })
        vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Search TODOs' })
        vim.keymap.set('n', ']t', require('todo-comments').jump_next, { desc = 'Next TODO' })
        vim.keymap.set('n', '[t', require('todo-comments').jump_prev, { desc = 'Prev TODO' })
    end

}
