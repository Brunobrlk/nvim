return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		presets = {
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- adds border to hover/signature
		},
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
		},
		popupmenu = {
			enabled = true,
			backend = "nui", -- important for rounded borders
		},
		lsp = {
			progress = {
				enabled = false,
			},
			hover = {
				enabled = true,
				view = nil, -- uses default popup
			},
			signature = {
				enabled = true, -- ❗ disable if using blink or lsp_signature
			},
			message = {
				enabled = true,
			},
		},
	},
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
}
