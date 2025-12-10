--- For highlighting color codes in CSS and HTML files
return
{
    {
        'litoj/colorizer.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        enabled = false,
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        opts = { -- set to setup table
        },
    }
}
