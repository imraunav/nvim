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

            -- autocomplete
            {
                'saghen/blink.cmp',
                main = 'blink.cmp',
                dependencies = { 'rafamadriz/friendly-snippets' },
                opts = {
                    keymap = { preset = 'default' },

                    appearance = {
                        use_nvim_cmp_as_default = true,
                        nerd_font_variant = 'mono'
                    },
                    fuzzy = { implementation = "lua" },
                    signature = {
                        enabled = true, -- show signature
                        window = {
                            show_documentation = true,
                            winblend = 15,
                        }, -- show docs with signature
                    },
                },
                opts_extend = { "sources.default" },
            },
        },
        config = function()
            -- autocommand to add keypress capabilities on attaching to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local desc_opt = function(desc)
                        return vim.tbl_extend('force', opts, { desc = desc })
                    end
                    -- Jump to the definition of the word under your cursor.
                    vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<Cr>', desc_opt('LSP Hover'))
                    -- Jump to the type of the word under your cursor.
                    vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<Cr>', desc_opt('Goto Definition'))
                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<Cr>', desc_opt('Goto Declaration'))
                    -- Jump to the implementation of the word under your cursor.
                    vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<Cr>',
                        desc_opt('Goto implementation'))
                    vim.keymap.set('n', 'go', '<Cmd>lua vim.lsp.buf.type_definition()<Cr>', desc_opt('Goto typedef'))
                    -- Find references for the word under your cursor.
                    vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<Cr>', desc_opt('Goto references'))
                    vim.keymap.set('n', 'gs', '<Cmd>lua vim.lsp.buf.signature_help()<Cr>',
                        desc_opt('Show signature_help'))
                    -- Rename the variable under your cursor.
                    vim.keymap.set('n', '<leader>cr', '<Cmd>lua vim.lsp.buf.rename()<Cr>', desc_opt('LSP Rename'))
                    vim.keymap.set({ 'n', 'x' }, '<F3>', '<Cmd>lua vim.lsp.buf.format({async = true})<Cr>',
                        desc_opt('Format using LSP'))
                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    vim.keymap.set('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<Cr>', desc_opt('Code Actions'))
                end
            })

            -- diagnostics config
            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                },
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                },
            }


            -- configure lsp servers
            local lsp = require('lspconfig')

            -- add language servers here { (key)server_name : (lua_tbl)server_config }
            local servers = {
                lua_ls = {
                    on_init = function(client)
                        if client.workspace_folders then
                            local path = client.workspace_folders[1].name
                            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                                return
                            end
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT'
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME
                                    -- Depending on the usage, you might want to add additional paths here.
                                    -- "${3rd}/luv/library"
                                    -- "${3rd}/busted/library",
                                }
                                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                                -- library = vim.api.nvim_get_runtime_file("", true)
                            }
                        })
                    end,
                    settings = {
                        Lua = {}
                    }

                },
                clangd = {},
                pyright = {}, -- install node for this to work :(
                -- pylsp = {},
            }
            local ensure_installed = vim.tbl_keys(servers or {})

            -- add formatters here
            vim.list_extend(ensure_installed, {
            })

            require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

            -- add blik.cmp capabilities to the lsp server
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                require('blink.cmp').get_lsp_capabilities()
            )

            require('mason-lspconfig').setup({
                ensure_installed = {}, -- handled by mason-tool-installer hence empty
                handlers = {
                    function(server_name)
                        local server_conf = servers[server_name] or {}
                        server_conf.capabilities = vim.tbl_deep_extend(
                            "force",
                            capabilities,
                            server_conf.capabilities or {}
                        )
                        lsp[server_name].setup(server_conf)
                    end,
                },
            })

            -- autoformat
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client.supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })
        end

    }
}
