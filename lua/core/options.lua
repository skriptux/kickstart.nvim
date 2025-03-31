local opt = vim.opt

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Session Management
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'
opt.showmode = false
vim.diagnostic.config {
  float = { border = 'rounded' }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = 'indent,eol,start'

-- Clipboard
opt.clipboard:append 'unnamedplus'

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append '-'

-- Disable the mouse while in nvim
opt.mouse = ''

-- Folding
opt.foldlevel = 20
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Utilize Treesitter folds

-- vim.opt.wrap = false
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.mouse = 'a'
-- vim.opt.showmode = false
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)
-- vim.opt.breakindent = true
-- vim.opt.undofile = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
-- vim.opt.signcolumn = 'yes'
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
-- vim.opt.list = true
-- vim.opt.inccommand = 'split'
-- vim.opt.cursorline = true
-- vim.opt.scrolloff = 10
-- vim.opt.confirm = true
