return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	opts = {
		preset = "modern",
		plugins = {
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			marks = true,
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			no_overlap = true,
			width = { min = vim.o.columns }, -- full editor width
			col = 0, -- start at left edge

			padding = { 1, 2 },

			title = false,
			zindex = 1000,

			wo = {},
			bo = {},
		},

		layout = {
			spacing = 3, -- spacing between columns
			align = "left", -- left aligned columns

			height = {
				min = 4,
				max = 4, -- exactly 4 rows
			},
		},
		spec = {

			-- Flutter
			{ "<leader>f", group = "Flutter" },
			{ "<leader>fc", "<cmd>FlutterCopyProfilerUrl<cr>", desc = "Copy Profiler Url" },
			{ "<leader>fC", "<cmd>Telescope flutter commands<CR>", desc = "Commands" },
			{ "<leader>fd", "<cmd>FlutterDevices<cr>", desc = "Devices" },
			{ "<leader>fe", "<cmd>FlutterEmulators<cr>", desc = "Emulators" },
			{ "<leader>fh", "<cmd>FlutterReload<cr>", desc = "Hot Reload" },
			{ "<leader>fH", "<cmd>FlutterRestart<cr>", desc = "Hot Restart" },
			{ "<leader>fl", "<cmd>FlutterLogToggle<cr>", desc = "Log Toggle" },
			{ "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Outline" },
			{ "<leader>fp", "<cmd>FlutterPubGet<cr>", desc = "Pub Get" },
			{ "<leader>fq", "<cmd>FlutterQuit<cr>", desc = "Quit" },
			{ "<leader>fr", "<cmd>FlutterRun<cr>", desc = "Run" },
			{ "<leader>ft", "<cmd>FlutterDevTools<cr>", desc = "Dev Tools" },
			{ "<leader>fx", "<cmd>FlutterLogClear<cr>", desc = "Log Clear" },

			-- Search
			{ "<leader>s", group = "Search" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Last Picker" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
			{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word" },
			{ "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo History" },

			-- LSP
			{
				"<leader>lf",
				"<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>",
				desc = "Format(Conform)",
			},
			{ "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart LSP" },

			-- Theme
			{ "<leader>Lt", "<cmd>Telescope colorscheme {enable_preview = true}<cr>", desc = "Theme" },

			-- Python
			{ "<leader>P", group = "Python" },
			{ "<leader>Pv", "<cmd>VenvSelect<cr>", desc = "Venv select" },

			-- Exit
			{ "<leader>Q", "<cmd>quitall<CR>", desc = "Exit Session" },

			-- Session
			{ "<leader>r", group = "Session" },
			{ "<leader>rw", "<cmd>AutoSession search<cr>", desc = "Select session" },
			{ "<leader>rs", "<cmd>AutoSession save<cr>", desc = "Save session" },

			-- Sudo
			{ "<leader>S", group = "Sudo" },
			{ "<leader>Sw", "<cmd>SudaWrite<CR>", desc = "Save with Sudo" },
			{ "<leader>Sr", "<cmd>SudaRead<CR>", desc = "Open with Sudo" },

			-- Telescope
			{ "<leader>t", group = "Telescope" },
			{ "<leader>tp", "<cmd>Telescope projects<CR>", desc = "Recent Projects" },
			{ "<leader>tP", "<cmd>Telescope project<CR>", desc = "Select Project" },
			{ "<leader>tn", "<cmd>NoiceTelescope<CR>", desc = "Noice Messages" },
			{
				"<leader>tc",
				function()
					require("telescope.builtin").live_grep({
						prompt_title = "Cheatsheets",
						cwd = vim.fn.expand("~/.utils/Cheatsheets"),
					})
				end,
				desc = "Cheatsheet",
			},
			{ "<leader>tb", "<cmd>Telescope bookmarks list<cr>", desc = "Bookmarks" },

			-- Trouble
			{ "<leader>y", group = "Trouble" },
			{ "<leader>yx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
			{ "<leader>yX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>yL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
			{ "<leader>yQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
			{ "<leader>ys", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
			{ "<leader>yl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP References" },
		},
	},
}
