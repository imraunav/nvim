-- autocommand to add keypress capabilities on attaching to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        local desc_opt = function(desc)
            return vim.tbl_extend('force', opts, { desc = desc })
        end
        -- Jump to the definition of the word under your cursor.
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, desc_opt('LSP Hover'))
        -- Jump to the type of the word under your cursor.
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, desc_opt('Goto Definition'))
        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, desc_opt('Goto Declaration'))
        -- Jump to the implementation of the word under your cursor.
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end,
            desc_opt('Goto implementation'))
        vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, desc_opt('Goto typedef'))
        -- Find references for the word under your cursor.
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, desc_opt('Goto references'))
        vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end,
            desc_opt('Show signature_help'))
        -- Rename the variable under your cursor.
        vim.keymap.set({ 'n', 'v' }, '<leader>cr', function() vim.lsp.buf.rename() end,
            desc_opt('LSP Rename'))
        vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end,
            desc_opt('Format using LSP'))
        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, desc_opt('Code Actions'))
    end
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
