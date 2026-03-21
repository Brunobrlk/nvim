return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		plugins = {
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			marks = true,
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			no_overlap = true,
			width = { min = vim.o.columns },
			col = 0,
			padding = { 1, 2 },
			title = false,
			zindex = 1000,
			wo = {},
			bo = {},
		},
		layout = {
			spacing = 3,
			align = "left",
			height = {
				min = 4,
				max = 4,
			},
		},
        spec = {
			{ "<leader>f", group = "Flutter" },
			{ "<leader>s", group = "Search" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>P", group = "Python" },
			{ "<leader>g", group = "Git" },
			{ "<leader>r", group = "Session" },
			{ "<leader>S", group = "Sudo" },
			{ "<leader>t", group = "Telescope" },
			{ "<leader>y", group = "Trouble" },
        }
	},
}
