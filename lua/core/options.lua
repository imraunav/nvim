-- netrw settings
vim.g.netrw_banner = 1 
vim.g.netrw_browse_split = 0 -- open in same window
vim.g.netrw_liststyle = 1 -- descriptive file listing
vim.g.netrw_sizestyle = "H" -- human readable size
vim.g.netrw_altfile = 1
vim.g.netrw_altv = 'spr'
vim.g.netrw_alto = 'sb'

-- UI opts
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect", "preview" }
vim.opt.splitbelow = true -- split go below
vim.opt.splitright = true -- vertical split to the right
vim.opt.showtabline = 2 -- always show tabline
vim.opt.laststatus = 2 -- always show statusline
vim.opt.showcmd = true

-- tab setting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- expand tab

-- indentation setting
vim.opt.smartindent = true
vim.opt.syntax = 'ON'

-- don't wrap text
vim.opt.wrap = false

-- general file setting
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.fileencoding = "utf-8"

-- higlight and search
vim.opt.hlsearch = true -- manage it with <Esc> keybind
vim.opt.incsearch = true -- search as characters are entered
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- scroll and misc
vim.opt.scrolloff = 8 -- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8 -- scroll page when cursor is 8 spaces from left/right
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.isfname:append("@-@")
vim.opt.cmdheight = 2
vim.opt.pumheight = 10 -- number of items in popup menu

vim.cmd("filetype plugin on") -- set filetype
vim.cmd("set wildmenu") -- enable wildmenu

-- decrease timeout
vim.opt.updatetime = 50
vim.opt.timeoutlen = 600

-- show white space chars
vim.opt.list = true
vim.opt.listchars = { tab = '<->', nbsp = '␣', multispace = "." }

-- preview substitutions live!
vim.opt.inccommand = 'split'
