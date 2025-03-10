return {
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ":TSUpdate",
        config = function () 
            local conf = require("nvim-treesitter.configs")

            conf.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "python", "bash" },
                sync_install = false,
                auto_install = false,
                highlight = { 
                    enable = true, 
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },  
            })
        end
    }
}
