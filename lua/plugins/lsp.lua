return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                main = "mason",
                opts = {},
            },
            {
                "williamboman/mason-lspconfig.nvim",
                main = "mason-lspconfig",
            },

            -- useful for converting mason name to lspconfig name
            {
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                main = "mason-tool-installer",
            },

            -- Useful status updates for LSP.
            { 'j-hui/fidget.nvim', opts = {} },
        },

        config = function()

            -- autocommand to add keypress capabilities on attaching to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    -- Jump to the definition of the word under your cursor.
                    vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<Cr>', opts)
                    -- Jump to the type of the word under your cursor.
                    vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<Cr>', opts)
                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<Cr>', opts)
                    -- Jump to the implementation of the word under your cursor.
                    vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<Cr>', opts)
                    vim.keymap.set('n', 'go', '<Cmd>lua vim.lsp.buf.type_definition()<Cr>', opts)
                    -- Find references for the word under your cursor.
                    vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<Cr>', opts)
                    vim.keymap.set('n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<Cr>', opts)
                    -- Rename the variable under your cursor.
                    vim.keymap.set('n', '<F2>', '<Cmd>lua vim.lsp.buf.rename()<Cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', '<Cmd>lua vim.lsp.buf.format({async = true})<Cr>', opts)
                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    vim.keymap.set('n', '<F4>', '<Cmd>lua vim.lsp.buf.code_action()<Cr>', opts)
                end
            })

            -- configure lsp servers
            local lsp = require('lspconfig')

            -- add language servers here { (key)server_name : (lua_tbl)server_config }
            local servers = {
                lua_ls = {},
                clangd = {},
                -- pyright = {}, -- install node for this to work :(
                pylsp = {},
            }
            local ensure_installed = vim.tbl_keys(servers or {})

            -- add formatters here
            vim.list_extend(ensure_installed, {
                'stylua',
            })
            require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

            require('mason-lspconfig').setup({
                ensure_installed = {}, -- handled by mason-tool-installer
                handlers = {
                    function(server_name)
                        local server_conf = servers[server_name]
                        lsp[server_name].setup(server_conf)
                    end,
                },
            })
        end

    }
}
