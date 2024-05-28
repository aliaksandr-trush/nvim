return {
    {
        "Exafunction/codeium.nvim",
        -- dev = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "rohanorton/ws.nvim",
        },
        config = function()
            local codeium = require("codeium")
            codeium.setup({
                enable_chat = true,
                enable_local_search = true,
                enable_index_service = true,
            })
            -- vim.keymap.set('n', '<leader>cc', require('codeium').open_chat, { desc = "Codeium Chat" })
            vim.keymap.set('n', '<leader>cc', "<cmd>Codeium Chat<cr>", { desc = "Codeium" })
        end,
    },
    {
        "Exafunction/codeium.vim",
        enabled = false,
    }
}
