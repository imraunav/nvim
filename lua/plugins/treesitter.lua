return {
    {
        'nvim-treesitter/nvim-treesitter',
        main = "nvim-treesitter.configs",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "markdown", "python", "bash" },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gvv", -- set to `false` to disable one of the mappings
                    node_incremental = "v",
                    scope_incremental = none,
                    node_decremental = "V",
                },
            },
        }
    }
}
