return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ dir = "~/Development/Projects/lualine-components.nvim" },
	},
	config = function()
		local avd = require("linecomp.avd")
		local companion = require("linecomp.codecompanion")
        local dev =  require("linecomp.dev")

		require("lualine").setup({
			options = {
				theme = "auto",
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
				lualine_a = {
					{ dev.dev_indicator, color = { fg = "#000000", bg = "#A6E3A1", gui = "bold" } },
					"mode",
				},
				lualine_b = { "branch" },
				lualine_c = {
					"diff",
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					"filetype",
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					"searchcount",
					avd.android_model,
					"encoding",
					{
						"lsp_status",
						icon = "",
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							done = "✓",
							separator = " ",
						},
						ignore_lsp = {},
						show_name = true,
					},
				},
				lualine_z = { "progress", "location" },
				lualine_y = { companion.codecompanion_tokens, companion.codecompanion_model },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
