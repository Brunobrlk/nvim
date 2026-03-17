return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"kotlin",
				"java",
				"xml",
				"groovy",
				"dart",
				"c",
				"cpp",
				"c_sharp",
				"lua",
				"python",
				"bash",
				"json",
				"toml",
				"yaml",
				"ruby",
				"html",
				"css",
				"javascript",
				-- Add any other parsers you want here
			},
			sync_install = false, -- Install parsers asynchronously
			auto_install = true, -- Automatically install missing parsers
			highlight = {
				enable = true, -- Enable syntax highlighting
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true }, -- Enable indentation based on treesitter
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Strip whitespace in textobjects
					keymaps = {
						-- You can add your own text object keymaps here
						-- e.g., for 'a', 'i', 'f', 'F'
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- Whether to set jumps in the jumplist in the built-in jump action.
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		})
	end,
}
