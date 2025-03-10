vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

local opts = {
    noremap = true,      -- non-recursive
    silent = false,       -- show message
}

-- reload config
vim.keymap.set("n", "<leader>r", "<Cmd>source $MYVIMRC<CR>", opts)

-- save file
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", opts)

-- tab ops
vim.keymap.set("n", "<leader>t", "<Cmd>tabnew<CR>", opts)
vim.keymap.set("n", "<leader>p", "<Cmd>tabprevious<CR>", opts)
vim.keymap.set("n", "<leader>n", "<Cmd>tabnext<CR>", opts)
vim.keymap.set("n", "<leader>x", "<Cmd>tabclose<CR>", opts)

-- buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", opts)
vim.keymap.set("n", "<leader>bp", "<Cmd>bprev<CR>", opts)
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", opts)
vim.keymap.set("n", "<leader>bf", "<Cmd>buffers<CR>:b ", opts)

-- easy split (don't need these, use CTRL-W <key>)
-- vim.keymap.set("n", "<leader>vs", "<Cmd>vsplit<CR>", opts)
-- vim.keymap.set("n", "<leader>hs", "<Cmd>split<CR>", opts)

-- line/block move
vim.keymap.set("v", "K", "<Cmd>m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "J", "<Cmd>m '>+1<CR>gv=gv", opts)

-- explore key
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, opts)

-- keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>z.", opts)
vim.keymap.set("n", "<C-u>", "<C-u>z.", opts)

-- auto close brackets, paranthesis and quotes
vim.keymap.set("i", "'", "''<Left>", opts)
vim.keymap.set("i", "\"", "\"\"<Left>", opts)
vim.keymap.set("i", "(", "()<Left>", opts)
vim.keymap.set("i", "[", "[]<Left>", opts)
vim.keymap.set("i", "{}", "{}<Left>", opts)
vim.keymap.set("i", "{<CR>", "{<CR>}<Up><End>", opts)
vim.keymap.set("i", "{;<CR>", "{<CR>};<Up><End>", opts)
vim.keymap.set("i", "/*", "/**/<Left><Left>", opts)

-- enclose in visual mode, little different from the one used to in vscode 
vim.keymap.set("v", "''", "c'<C-R>\"'<Esc>", opts)
vim.keymap.set("v", "\"\"", "c\"<C-R>\"\"<Esc>", opts)
vim.keymap.set("v", "()", "c(<C-R>\")<Esc>", opts)
vim.keymap.set("v", "{}", "c{<C-R>\"}<Esc>", opts)
vim.keymap.set("v", "[]", "c[<C-R>\"]<Esc>", opts)

-- paste without replace in register
vim.keymap.set("x", "<leader>p", "\"_dP", opts)

-- replace instance of highlighted word
vim.keymap.set("v", "<leader>r", '"hy<Cmd>%s/<C-r>h//g<Left><Left>', opts) 

-- clear highlight when <Esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>", opts)

-- kind of bad
vim.keymap.set("i", "jk", "<Esc>", opts)

