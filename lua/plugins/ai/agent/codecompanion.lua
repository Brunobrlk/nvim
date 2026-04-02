return {
	"olimorris/codecompanion.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
		{ "MeanderingProgrammer/render-markdown.nvim", ft = { "codecompanion" } },
	},
	opts = { -- defaults: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
		adapters = {
			http = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = { api_key = "GEMINI_API_KEY" },
						schema = {
							model = {
								default = "gemini-3-flash-preview",
								choices = {
									"gemini-3-flash-preview",
									"gemini-2.5-pro",
									"gemini-2.5-flash",
									"gemini-2.5-flash-lite",
									"gemini-2.5-flash-lite-preview-09-2025",
								},
							},
						},
					})
				end,
				ollama_remote = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "https://ollama.com",
							api_key = "OLLAMA_API_KEY",
						},
						headers = { ["Authorization"] = "Bearer ${api_key}" },
						schema = {
							model = { default = "glm-5" },
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
						env = {
							url = "https://api.groq.com/openai",
							api_key = "GROQ_API_KEY",
							chat_url = "/v1/chat/completions",
							models_endpoint = "/v1/models",
						},
						schema = {
							model = { default = "openai/gpt-oss-20b" },
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
							model = { default = "mistral-large-latest" },
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				adapter = "gemini",
				editor_context = {
					["buffer"] = {
						opts = {
							default_params = "diff", -- Always sync the buffer by sharing its "diff"
						},
					},
				},
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
			inline = { adapter = "mistral" },
			cmd = { adapter = "ollama_remote" },
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
		display = {
			chat = {
				show_token_count = true,
				show_tools_processing = true,
				start_in_insert_mode = false,
				intro_message = "CodeCompanion: ask, edit, execute | ? help | /prompts | #context | @tools | /acp_slash_cmd ",
			},
			diff = {
				enabled = true,
				threshold_for_chat = 6, -- At or below this diff size, always display the diff in the chat buffer
				word_highlights = {
					additions = true,
					deletions = true,
				},
			},
		},
	},
}
