return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		{ "folke/lazydev.nvim", ft = "lua" },
		version = "v2.*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ -- Load my snippets
				paths = { "./snippets" },
			})
		end,
	},
	opts = {
		keymap = {
			preset = "default", -- set to 'none' to disable the 'default' preset
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-e>"] = false, -- disable a keymap from the preset
			["<C-space>"] = { -- show with a list of providers
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
			["<CR>"] = { "accept", "snippet_forward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},
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
	},
	opts_extend = { "sources" }, -- Whatever parts of the options table you need to extend
}
