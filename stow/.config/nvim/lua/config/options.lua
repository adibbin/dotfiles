local options = {
	clipboard = "unnamedplus",
	conceallevel = 1,
	cursorline = true,
	mouse = "a",
	scrolloff = 8,
	showmode = false,
	swapfile = false,
	termguicolors = true,
	textwidth = 80,

	-- Indenting
	autoindent = true,
	shiftwidth = 2,
	smartindent = true,
	tabstop = 2,

	-- Numbers
	number = true,
	relativenumber = true,

	-- Split
	splitbelow = true,
	splitright = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
