return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- { 'nvim-telescope/telescope-ui-select.nvim' },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						preview_width = 0.67,
						results_width = 0.33,
						mirror = false,
					},
					width = 0.85,
					height = 0.85,
					preview_cutoff = 120,
				},
				winblend = 0,
				path_display = { "truncate" },
				file_ignore_patterns = {
					"%.git",
					"node_modules/",
					"/generated/",
				},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				sorting_strategy = "ascending",
			},
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"f",
						"--hidden",
						"--exclude",
						".git",
						"--exclude",
						"node_modules",
						"--exclude",
						"generated",
						"--exclude",
						".venv",
					},
				},
			},
		})
		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "flutter")
	end,
}
