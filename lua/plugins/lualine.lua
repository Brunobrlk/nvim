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
                      }
				},
				lualine_x = {
					"searchcount",
					avd.android_model,
					"encoding",
					{
						"lsp_status",
						icon = "", -- f013
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- Unicode symbols to cycle through for LSP progress
							done = "✓", -- Standard unicode symbol for when LSP is done
							separator = " ", -- Delimiter inserted between LSP names
						},
						ignore_lsp = {}, -- List of LSP names to ignore (e.g., `null-ls`):
						show_name = true, -- Display the LSP name
					},
				},
				lualine_z = { "progress", "location" },
				lualine_y = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
