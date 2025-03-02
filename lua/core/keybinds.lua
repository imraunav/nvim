vim.g.mapleader = "\\"

local opts = {
    noremap = true,      -- non-recursive
    silent = false,       -- show message
}

-- reload config
vim.keymap.set("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>", opts)

-- save file
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)

-- tab ops
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>p", ":tabprevious<CR>", opts)
vim.keymap.set("n", "<leader>n", ":tabnext<CR>", opts)
vim.keymap.set("n", "<leader>x", ":tabclose<CR>", opts)

-- easy split
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>hs", ":split<CR>", opts)

-- line/block move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- explore key
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, opts)

-- keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>z.", opts)
vim.keymap.set("n", "<C-u>", "<C-u>z.", opts)

-- auto close brackets, paranthesis and quotes
vim.keymap.set("i", "'", "''<left>", opts)
vim.keymap.set("i", "\"", "\"\"<left>", opts)
vim.keymap.set("i", "(", "()<left>", opts)
vim.keymap.set("i", "[", "[]<left>", opts)
vim.keymap.set("i", "{}", "{}<left>", opts)
vim.keymap.set("i", "{<CR>", "{<CR>}<up><End>", opts)
vim.keymap.set("i", "{;<CR>", "{<CR>};<up><End>", opts)
vim.keymap.set("i", "/*", "/**/<left><left>", opts)

-- eclose in visual mode, little different from the one used to in vscode 
vim.keymap.set("v", "''", "c'<C-R>\"'<Esc>", opts)
vim.keymap.set("v", "\"\"", "c\"<C-R>\"\"<Esc>", opts)
vim.keymap.set("v", "()", "c(<C-R>\")<Esc>", opts)
vim.keymap.set("v", "{}", "c{<C-R>\"}<Esc>", opts)
vim.keymap.set("v", "[]", "c[<C-R>\"]<Esc>", opts)

-- paste without replace in register
vim.keymap.set("x", "<leader>p", "\"_dP", opts)

-- replace instance of highlighted word
vim.keymap.set("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', opts) 

-- clear highlight when <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", opts)

-- kind of bad
vim.keymap.set("i", "jk", "<Esc>", opts)

