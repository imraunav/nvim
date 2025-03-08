return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            enabled = true,
            scope = {
                enabled = true,
            },
            indent = {
                char = '▏',
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup {
            }
        end
    },
}
