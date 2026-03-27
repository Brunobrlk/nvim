return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		{ "folke/lazydev.nvim", ft = "lua" },
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("luasnip").config.setup({})
				require("luasnip.loaders.from_vscode").lazy_load({
					include = {
						"kotlin",
						"java",
						"dart",
						"lua",
						"python",
						"bash",
						"sh",
						"json",
						"yaml",
						"toml",
						"javascript",
						"typescript",
						"html",
						"css",
					},
				})
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = { vim.fn.stdpath("config") .. "/snippets" },
				})
			end,
		},
	},
	opts = {
		completion = {
			documentation = { auto_show = true },
		},
		signature = { enabled = false },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		snippets = { preset = "luasnip" },
		cmdline = { enabled = true },
		keymap = {
			preset = "none",
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-n>"] = { "select_next", "snippet_forward", "fallback" },
			["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				function(cmp) -- Only accept blink if no supermaven ghost text is visible
					local ok, supermaven = pcall(require, "supermaven-nvim.completion_preview")
					if ok and supermaven.has_suggestion() then
						return false -- let supermaven handle it
					end
					return cmp.accept()
				end,
				"snippet_forward",
				"fallback",
			},
			["<C-y>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
		},
	},
	opts_extend = { "sources" }, -- Whatever parts of the options table you need to extend
}
