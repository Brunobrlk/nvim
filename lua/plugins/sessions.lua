return {
	"rmagatti/auto-session", -- Session Manager
	lazy = false,
	opts = {
		allowed_dirs = { "~/.utils/*", "~/Development/*", "~/.local/*", "~/.config/*", "~/Src/*" },
		session_lens = {
			picker = "telescope",
		},
		post_restore_cmds = {
			function()
				local nvim_tree_api = require("nvim-tree.api")
				nvim_tree_api.tree.open()
				nvim_tree_api.tree.change_root(vim.fn.getcwd())
				nvim_tree_api.tree.reload()
			end,
		},
	},
}
