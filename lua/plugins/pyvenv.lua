return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim", -- optional: you can also use fzf-lua, snacks, mini-pick instead.
			version = "*",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	ft = "python", -- Load when opening Python files
	-- keys = { { ",v", "<cmd>VenvSelect<cr>" } }, -- Open picker on keymap
	opts = {
		name = { ".venv", "venv" },
		search_workspace = true,
		auto_refresh = true,
		options = {
			debug = false, -- Set to true if you need to debug
			on_telescope_result_callback = function(filename)
				-- This ensures the path is displayed nicely in Telescope
				return filename:gsub(os.getenv("HOME"), "~"):gsub("/bin/python", "")
			end,
		},
	},
}
