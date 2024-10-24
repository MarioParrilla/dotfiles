-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ "hrsh7th/nvim-cmp" },
        { import = "plugins"},
        { "hrsh7th/cmp-nvim-lsp" },   -- LSP source for nvim-cmp
        { "hrsh7th/cmp-buffer" },      -- Buffer completions
        { "hrsh7th/cmp-path" },        -- Path completions
        { "hrsh7th/cmp-cmdline" },     -- Command line completions
        { "L3MON4D3/LuaSnip" },        -- Snippet engine
        { "saadparwaiz1/cmp_luasnip" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
require('onedark').load()
require("telescope").load_extension "file_browser"

vim.cmd("set number")
vim.cmd("set mouse=a")
vim.cmd("syntax enable")
vim.cmd("set showcmd")
vim.cmd("set encoding=utf-8")
vim.cmd("set showmatch")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=0")
vim.cmd("set softtabstop=0")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.keymap.set('n', '<M-Left>', '<C-w>h', {})
vim.keymap.set('n', '<M-Right>', '<C-w>l', {})
vim.keymap.set('n', '<M-i>', '<cmd>Telescope lsp_implementations<cr>', {})
vim.keymap.set('n', '<M-e>', '<cmd>Telescope diagnostics bufnr=0<cr>', {})
vim.keymap.set('n', '<M-r>', '<cmd>Telescope lsp_references<cr>', {})
vim.keymap.set('n', '<M-b>', ':bprev<CR>', {})
vim.keymap.set('n', '<M-t>', '<cmd>Telescope lsp_type_definitions<CR>', {})
vim.keymap.set('n', '<M-d>', '<cmd>Telescope lsp_definitions<CR>', {})
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", {})
