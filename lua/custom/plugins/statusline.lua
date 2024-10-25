return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dev = true,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "yavorski/lualine-macro-recording.nvim"
    },
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = true,
            -- theme = 'auto',
            theme = 'kanagawa',
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    path = 1,
                },
                "macro_recording"
            },
        },
        inactive_sections = {
            lualine_c = { { "filename", path = 4, } },
        },
    },
}
