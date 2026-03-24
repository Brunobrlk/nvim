return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false, -- Often needs to load early for LSP setup
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ dir = "~/Development/Projects/nvim-android-device" },
	},
	ft = { "dart" }, -- Only load for Dart files
	config = function()
		require("flutter-tools").setup({
			decorations = {
				statusline = {
					app_version = true,
					device = true,
					project_config = true,
				},
			},
			dev_log = {
				enabled = true,
				filter = nil,
				notify_errors = true,
				open_cmd = "15split",
				focus_on_open = true,
			},
			outline = {
				open_cmd = "50vnew",
				auto_open = false,
			},
			lsp = {
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					enableSnippets = true,
					updateImportsOnRename = true,
					renameFilesWithClasses = "always",
				},
			},
		})
	end,
}
