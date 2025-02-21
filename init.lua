-- ---------------
-- Editor settings
-- ---------------
vim.g.mapleader = "\\"					-- set leader key
vim.g.netrw_banner = 1					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw
vim.opt.title = true					-- show title
vim.cmd('set path+=**')					-- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false				-- turn off vi compatibility mode
vim.opt.number = true					-- turn on line numbers
vim.opt.relativenumber = true			-- turn on relative line numbers
vim.opt.mouse = 'v'						-- enable the mouse in all modes
vim.opt.ignorecase = true				-- enable case insensitive searching
vim.opt.smartcase = true				-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false				-- disable all highlighted search results
vim.opt.incsearch = true				-- enable incremental searching
vim.opt.wrap = false					-- enable text wrapping
vim.opt.tabstop = 4						-- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8"			-- encoding set to utf-8
vim.opt.pumheight = 10					-- number of items in popup menu
vim.opt.showtabline = 2					-- always show the tab line
vim.opt.laststatus = 2					-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false				-- expand tab 
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showmode = true
vim.opt.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"
vim.opt.clipboard = unnamedplus
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.splitbelow = true				-- split go below
vim.opt.splitright = true				-- vertical split to the right
vim.opt.termguicolors = true			-- terminal gui colors
vim.cmd('colorscheme deus')				-- set colorscheme
vim.cmd('filetype plugin on')			-- set filetype 
vim.cmd('set wildmenu')					-- enable wildmenu

-- ---------
--statusline
-- ---------
vim.cmd "highlight StatusMode guibg=#185196 guifg=#f0f2f5 gui=bold"
vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021 gui=bold"
vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021 gui=italic"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=white"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021 gui=bold"
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=grey guifg=white"

--mode map
-- mode_map copied from:
-- https://github.com/nvim-lualine/lualine.nvim/blob/5113cdb32f9d9588a2b56de6d1df6e33b06a554a/lua/lualine/utils/mode.lua
local mode_map = {
  ['n']      = 'NORMAL',
  ['no']     = 'O-PENDING',
  ['nov']    = 'O-PENDING',
  ['noV']    = 'O-PENDING',
  ['no\22']  = 'O-PENDING',
  ['niI']    = 'NORMAL',
  ['niR']    = 'NORMAL',
  ['niV']    = 'NORMAL',
  ['nt']     = 'NORMAL',
  ['v']      = 'VISUAL',
  ['vs']     = 'VISUAL',
  ['V']      = 'V-LINE',
  ['Vs']     = 'V-LINE',
  ['\22']    = 'V-BLOCK',
  ['\22s']   = 'V-BLOCK',
  ['s']      = 'SELECT',
  ['S']      = 'S-LINE',
  ['\19']    = 'S-BLOCK',
  ['i']      = 'INSERT',
  ['ic']     = 'INSERT',
  ['ix']     = 'INSERT',
  ['R']      = 'REPLACE',
  ['Rc']     = 'REPLACE',
  ['Rx']     = 'REPLACE',
  ['Rv']     = 'V-REPLACE',
  ['Rvc']    = 'V-REPLACE',
  ['Rvx']    = 'V-REPLACE',
  ['c']      = 'COMMAND',
  ['cv']     = 'EX',
  ['ce']     = 'EX',
  ['r']      = 'REPLACE',
  ['rm']     = 'MORE',
  ['r?']     = 'CONFIRM',
  ['!']      = 'SHELL',
  ['t']      = 'TERMINAL',
}

-- functional wrapper to show mode name in statusline
function nvimmode(  )
	local mode = vim.api.nvim_get_mode().mode
	local mode_name = mode_map[mode] or mode
	return mode_name
end
-- set statusline
vim.o.statusline = "%#StatusMode#"
				.. " "
				.. "%{v:lua.nvimmode(  )}"
				.. " "
				.. "%#StatusType#"
				.. " "
				.. ""
				.. "%{&filetype}" 
				.. " "
				.. "%#StatusFile#"
				.. " "
				.. "file: %<%F"
				.. " "
				.. "%#StatusModified#"
				.. " "
				.. "%m"
				.. " "
				.. "%#StatusNorm#"
				.. "%="
				.. "%#StatusBuffer#"
				.. " "
				.. "BUFF: "
				.. "%n"
				.. " "
				.. "%#StatusLocation#"
				.. " "
				.. "l,c: %l,%c"
				.. " "
				.. "%#StatusPercent#"
				.. " "
				.. "--%p%%-- "

-- ------------
-- key bindings
-- ------------
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")	-- reload neovim config

-- save file
map("n", "<C-s>", ":w<CR>")

-- Open netrw in 25% split in tree view
map("n", "<leader>l", ":25Lex<CR>")					-- leader+l toggles netrw tree view

-- Tab bindings 
map("n", "<leader>t", ":tabnew<CR>")				-- leader+t creates new tab
map("n", "<leader>x", ":tabclose<CR>")				-- leader+x closes current tab
map("n", "<leader>p", ":tabprevious<CR>")			-- leader+p moves to previous tab
map("n", "<leader>n", ":tabnext<CR>")				-- leader+n moves to next tab

-- easy split generation
map("n", "<leader>vs", ":vsplit<CR>")				-- leader+vs creates a veritcal split
map("n", "<leader>hs", ":split<CR>")				-- leader+hs creates a horizontal split

-- easy split navigation
-- map("n", "<leader>w", "<C-w>h")						-- leader+w switches to left split
-- map("n", "<leader>e", "<C-w>l")						-- leader+e switches to right split
-- map("n", "<leader>s", "<C-w>j")						-- leader+d switches to bottom split
-- map("n", "<leader>n", "<C-w>k")						-- leader+u switches to top split

-- adjust split sizes easier
map("n", "<leader>vl", ":vertical resize +3<CR>")		-- leader+vl resizes vertical split +
map("n", "<leader>vr", ":vertical resize -3<CR>")		-- leader+vr resizes vertical split -

-- buffer navigation
-- map("n", "<leader>nb", ":bnext <CR>")					-- leader+nb goes to next buffer
-- map("n", "<leader>pb", ":bprevious <CR>")				-- leader+pb goes to previous buffer
-- map("n", "<leader>db", ":bd! <CR>")						-- leader+db delets current buffer

-- Visual Maps
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")	-- Replace all instances of highlighted words 
map("v", "J", ":m '>+1<CR>gv=gv")						-- Move current line down
map("v", "K", ":m '>-2<CR>gv=gv")						-- Move current line up

-- Popup menu
-- map("i", "<C-p>", "<C-n>")								-- select autocomplete popup menu

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "(  )<left><left>")
map("i", "[", "[]<left>")
map("i", "{ ", "{ }<left>")
map("i", "{<CR>", "{}<left><CR><up><right><CR>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")
