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
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = {
							api_key = "GEMINI_API_KEY",
						},
						schema = {
							model = {
								default = "gemini-3.1-flash-preview",
                                choices = {
                                    "gemini-3.1-flash-lite-preview",
                                    "gemini-3-flash-preview",
                                    "gemini-2.5-pro",
                                    "gemini-2.5-flash",
                                    "gemini-2.5-flash-lite",
                                    "gemini-2.5-flash-lite-preview-09-2025",
                                }
							},
						},
					})
				end,
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
							model = { default = "glm-5" },
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
								choices = {
									"minimax/minimax-m2.5:free",
									"qwen/qwen3-coder:free",
									"openai/gpt-oss-120b:free",
									"z-ai/glm-4.5-air:free",
									"nvidia/nemotron-3-super-120b-a12b:free",
									"stepfun/step-3.5-flash:free",
									"qwen/qwen3.6-plus-preview:free",
								},
							},
						},
					})
				end,
				groq = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "groq",
						env = {
							url = "https://api.groq.com/openai",
							api_key = "GROQ_API_KEY",
							chat_url = "/v1/chat/completions",
							models_endpoint = "/v1/models",
						},
						schema = {
							model = {
								default = "openai/gpt-oss-20b",
							},
						},
					})
				end,
				mistral = function()
					return require("codecompanion.adapters").extend("mistral", {
						env = {
							url = "https://api.mistral.ai",
							api_key = "MISTRAL_API_KEY",
						},
						schema = {
							model = {
								default = "mistral-large-latest",
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
				adapter = "gemini",
				model = "gemini-3.1-flash-lite-preview",
			},
			inline = {
				adapter = "ollama_remote",
				model = "glm-5",
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
            cmd = {
				adapter = "ollama_remote",
				model = "glm-5",
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
        opts = {}
	},
}
