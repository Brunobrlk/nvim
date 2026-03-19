return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local avd = require("scripts.nvim_android_device")
		require("lualine").setup({
			options = {
				theme = "auto", -- or your desired theme
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_last_status = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filetype" },
				lualine_x = {
					"searchcount",
					avd.android_model,
					"encoding",
					"lsp_status",
				},
				lualine_z = { "progress", "location" },
				lualine_y = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
