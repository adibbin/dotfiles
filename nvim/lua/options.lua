local opt = vim.opt

-- Appearance
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.termguicolors = true

-- Editing
opt.clipboard = "unnamedplus"
opt.conceallevel = 1
opt.scrolloff = 8
opt.textwidth = 80

-- Indenting
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

-- Files
opt.swapfile = false

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Completion
opt.completeopt = "menuone,noselect,popup"
