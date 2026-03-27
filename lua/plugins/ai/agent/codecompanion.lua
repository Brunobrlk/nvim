return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
		{ "MeanderingProgrammer/render-markdown.nvim", ft = { "codecompanion" } },
	},
	opts = {
		adapters = {
			http = {
				ollama_remote = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "ollama_remote",
						env = {
							url = "https://ollama.com",
							api_key = "OLLAMA_API_KEY",
						},
						headers = {
							["Authorization"] = "Bearer ${api_key}",
						},
						schema = {
							model = { default = "deepseek-coder:33b" },
							num_ctx = { default = 32768 },
						},
					})
				end,
			},
		},
		interactions = {
			chat = { adapter = "ollama_remote" },
			inline = { adapter = "ollama_remote" },
		},
		strategies = {
			chat = {
				adapter = "gemini",
				tools = {
					["mcp"] = {
						callback = function()
							return require("mcphub.extensions.codecompanion")
						end,
						description = "Call MCP tools (filesystem, LSP, GitHub, web)",
						opts = { requires_approval = true },
					},
				},
			},
			inline = { adapter = "gemini" },
			agent = { adapter = "gemini" },
		},
		display = {
			chat = {
				show_token_count = true,
				show_tools_processing = true,
			},
			action_palette = {
				provider = "default",
			},
			diff = {
				provider = "mini_diff",
			},
		},
	},
}
