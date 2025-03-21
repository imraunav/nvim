return {
    --    {
    --         'nvim-telescope/telescope.nvim',
    --         branch = '0.1.x',
    --         dependencies = { 'nvim-lua/plenary.nvim' },
    --         config = function()
    --             local builtin = require('telescope.builtin')
    --             vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    --             vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    --             vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope git files' })
    --             vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    --             vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    --         end
    --
    --     },
}
