return {
    {
        "neanias/everforest-nvim",
        main = "everforest",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        opts = {
            -- Your config here
            background = "soft",
            transparent_background_level = 1,
            italics = true,
            disable_italic_comments = false,
            float_style = "dim",
            dim_inactive_windows = true,
        }
    },
    {
        "rebelot/kanagawa.nvim",
        main = "kanagawa",
        opts = {
            lazy = false,
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        },
    }
}
