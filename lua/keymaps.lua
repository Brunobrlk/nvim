vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

local function nmap(lhs, rhs, desc)
	map("n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

local function vmap(lhs, rhs, desc)
	map("v", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

nmap("<C-k>", "<cmd>wincmd k<cr>", "Window up")
nmap("<C-j>", "<cmd>wincmd j<cr>", "Window down")
nmap("<C-h>", "<cmd>wincmd h<cr>", "Window left")
nmap("<C-l>", "<cmd>wincmd l<cr>", "Window right")

nmap("<leader>e", "<cmd>Neotree toggle<cr>", "Explorer")

nmap("<leader>q", "<cmd>quit<cr>", "Quit")
nmap("<leader>w", "<cmd>w<cr>", "Save")
nmap("<leader>Q", "<cmd>quitall<cr>", "Quit all")

nmap("<leader>h", "<cmd>nohlsearch<CR>", "No highlight")
