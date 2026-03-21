return {
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"numToStr/Comment.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"matze/vim-move",
		init = function()
			vim.g.move_map_keys = 0
		end,
	},
	{ "nvim-mini/mini.bufremove", version = "*" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
				tab_char = "▏",
			},
			whitespace = {
				remove_blankline_trail = false,
			},
			scope = {
				enabled = false,
			},
		},
	},
}
