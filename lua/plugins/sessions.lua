return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		allowed_dirs = {
			"~/.utils/*",
			"~/Development/*",
			"~/.local/*",
			"~/.config/*",
			"~/Src/*",
		},
		session_lens = {
			picker = "telescope",
		},
		pre_save_cmds = { "lua require'nvim-tree'.setup()", "tabdo NvimTreeClose" },
	},
}
