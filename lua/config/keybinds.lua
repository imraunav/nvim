vim.g.mapleader = "\\"
vim.g.maplocalleader = " "


local desc_opt = function(desc)
    local opts = {
        noremap = true, -- non-recursive
        silent = false, -- show message
    }
    return vim.tbl_extend('force', opts, { desc = desc })
end

-- reload config
vim.keymap.set("n", "<leader>r", "<Cmd>source $MYVIMRC<CR>", desc_opt("Reload config"))

-- save file
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", desc_opt("Save buffer to file"))

-- tab ops
vim.keymap.set("n", "<leader>tt", "<Cmd>tabnew<CR>", desc_opt("New Tab"))
vim.keymap.set("n", "<leader>tp", "<Cmd>tabprevious<CR>", desc_opt("Prev Tab"))
vim.keymap.set("n", "<leader>tn", "<Cmd>tabnext<CR>", desc_opt("Next Tab"))
vim.keymap.set("n", "<leader>tx", "<Cmd>tabclose<CR>", desc_opt("Close Tab"))

-- buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", desc_opt("Next Buffer"))
vim.keymap.set("n", "<leader>bp", "<Cmd>bprev<CR>", desc_opt("Prev Buffer"))
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", desc_opt("Del Buffer"))
vim.keymap.set("n", "<leader>bf", "<Cmd>buffers<CR>:b ", desc_opt("Buffer List"))

-- find files (this is overwritten when we have any fuzzy picker like telescope)
vim.keymap.set("n", "<leader>ff", ":find ", desc_opt("Find files"))

-- easy split (don't need these, use CTRL-W <key>)
-- vim.keymap.set("n", "<leader>vs", "<Cmd>vsplit<CR>", desc_opt("Vertical Split"))
-- vim.keymap.set("n", "<leader>hs", "<Cmd>split<CR>", desc_opt("Horizontal Split"))

-- line/block move
vim.keymap.set("v", "K", "<Cmd>m '<-2<CR>gv=gv", desc_opt("Move Block Up"))
vim.keymap.set("v", "J", "<Cmd>m '>+1<CR>gv=gv", desc_opt("Move Block Down"))

-- explore key
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, desc_opt("Open Netrw explore"))

-- keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>z.", desc_opt("Scroll down and keep cursor in middle"))
vim.keymap.set("n", "<C-u>", "<C-u>z.", desc_opt("Scroll up and keep cursor in middle"))

-- auto close brackets, paranthesis and quotes
vim.keymap.set("i", "'", "''<Left>", desc_opt("''"))
vim.keymap.set("i", "\"", "\"\"<Left>", desc_opt("\"\""))
vim.keymap.set("i", "(", "()<Left>", desc_opt("()"))
vim.keymap.set("i", "[", "[]<Left>", desc_opt("[]"))
vim.keymap.set("i", "{}", "{}<Left>", desc_opt("{}"))
vim.keymap.set("i", "{<CR>", "{<CR>}<Up><End>", desc_opt("{\n}"))
vim.keymap.set("i", "{;<CR>", "{<CR>};<Up><End>", desc_opt("{\n};"))
vim.keymap.set("i", "/*", "/**/<Left><Left>", desc_opt("/**/"))

-- enclose in visual mode, little different from the one used to in vscode
vim.keymap.set("v", "''", "c'<C-R>\"'<Esc>", desc_opt("(Text)"))
vim.keymap.set("v", "\"\"", "c\"<C-R>\"\"<Esc>", desc_opt("\"Text\""))
vim.keymap.set("v", "()", "c(<C-R>\")<Esc>", desc_opt("(Text)"))
vim.keymap.set("v", "{}", "c{<C-R>\"}<Esc>", desc_opt("{Text}"))
vim.keymap.set("v", "[]", "c[<C-R>\"]<Esc>", desc_opt("[Text]"))

-- paste without replace in register
vim.keymap.set("x", "<leader>p", "\"_dP", desc_opt("Paste without replace register"))

-- replace instance of highlighted word
vim.keymap.set("v", "<leader>r", '"hy:%s/<C-r>h//gc<Left><Left><Left>', desc_opt("Replace hl text"))

-- clear highlight when <Esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>", desc_opt("nohlsearch<Esc>"))

-- kind of bad
vim.keymap.set("i", "jk", "<Esc>", desc_opt("Extra <Esc>"))

-- diagnostic
vim.keymap.set("n", "<Leader><Leader>", function()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })
