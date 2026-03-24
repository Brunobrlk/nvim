return {
	"catppuccin/nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
