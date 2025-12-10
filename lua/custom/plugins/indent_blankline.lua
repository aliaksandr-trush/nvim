local highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
}

return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
        'hiphish/rainbow-delimiters.nvim',
    },
    -- See `:help ibl`
    event = { 'BufRead', 'BufNewFile' },
    -- priority = 200,
    main = 'ibl',
    opts = {},
    config = function()
        local hooks = require "ibl.hooks"

        require("ibl").setup {
            scope = {
                highlight = highlight,
                include = {
                    node_type = {
                        lua = { "table_constructor" },
                    },
                },
            }
        }

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
