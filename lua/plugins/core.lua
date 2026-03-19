return {
	"tpope/vim-surround",
	"tpope/vim-repeat",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"nvim-mini/mini.nvim",
		version = false,
	},
	{ "matze/vim-move" },
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
