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
				openrouter = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://openrouter.ai/api",
							api_key = "OPENROUTER_API_KEY",
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "minimax/minimax-m2.5:free",
							},
						},
					})
				end,
			},
		},
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_tools = true,
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
		interactions = {
			chat = {
				adapter = "ollama",
			},
			inline = {
				adapter = "ollama",
			},
			cli = {
				agent = "codex",
				agents = {
					codex = {
						cmd = "codex",
						args = {},
						description = "OpenAI Codex CLI",
					},
				},
			},
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
