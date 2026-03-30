return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ dir = "~/Development/Projects/nvim-android-device" },
	},
	config = function()
		local avd = require("nvim_android_device")

		local cc_status = {
			bufnr = nil,
			model = nil,
			tokens = 0,
		}

		local function get_chat_metadata(bufnr)
			if type(_G.codecompanion_chat_metadata) ~= "table" then
				return nil
			end
			if bufnr and _G.codecompanion_chat_metadata[bufnr] then
				return _G.codecompanion_chat_metadata[bufnr], bufnr
			end
			for chat_bufnr, metadata in pairs(_G.codecompanion_chat_metadata) do
				if type(metadata) == "table" then
					return metadata, chat_bufnr
				end
			end
			return nil
		end

		local function refresh_codecompanion_status(event_buf)
			local current_buf = vim.api.nvim_get_current_buf()
			local metadata, metadata_bufnr

			if vim.bo[current_buf].filetype == "codecompanion" then
				metadata, metadata_bufnr = get_chat_metadata(current_buf)
			end

			if not metadata and event_buf then
				metadata, metadata_bufnr = get_chat_metadata(event_buf)
			end

			if not metadata and cc_status.bufnr then
				metadata, metadata_bufnr = get_chat_metadata(cc_status.bufnr)
			end

			if not metadata then
				metadata, metadata_bufnr = get_chat_metadata(nil)
			end

			if not metadata then
				cc_status.bufnr = nil
				cc_status.model = nil
				cc_status.tokens = 0
				return
			end

			local adapter = metadata.adapter or {}
			local model = adapter.model
			if type(model) == "function" then
				local ok, resolved_model = pcall(model, adapter)
				if ok and type(resolved_model) == "string" then
					model = resolved_model
				else
					model = nil
				end
			elseif type(model) == "table" then
				model = model.default
			end

			cc_status.bufnr = metadata_bufnr
			cc_status.model = model or adapter.formatted_name or adapter.name
			cc_status.tokens = tonumber(metadata.tokens) or 0
		end

		local cc_group = vim.api.nvim_create_augroup("LualineCodeCompanion", { clear = true })
		vim.api.nvim_create_autocmd({ "User" }, {
			group = cc_group,
			pattern = {
				"CodeCompanionChat*",
				"CodeCompanionRequest*",
				"CodeCompanionTool*",
				"CodeCompanionContextChanged",
			},
			callback = function(args)
				refresh_codecompanion_status(args.buf)
				vim.schedule(vim.cmd.redrawstatus)
			end,
		})

		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			group = cc_group,
			pattern = "*",
			callback = function(args)
				refresh_codecompanion_status(args.buf)
			end,
		})

		refresh_codecompanion_status(nil)

		require("lualine").setup({
			options = {
				theme = "auto", -- or your desired theme
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_last_status = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					"diff",
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					"filetype",
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_x = {
					"searchcount",
					avd.android_model,
					"encoding",
					{
						"lsp_status",
						icon = "", -- f013
						symbols = {
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- Unicode symbols to cycle through for LSP progress
							done = "✓", -- Standard unicode symbol for when LSP is done
							separator = " ", -- Delimiter inserted between LSP names
						},
						ignore_lsp = {}, -- List of LSP names to ignore (e.g., `null-ls`):
						show_name = true, -- Display the LSP name
					},
				},
				lualine_z = { "progress", "location" },
				lualine_y = {
					{
						function()
							if not cc_status.tokens or cc_status.tokens <= 0 then
								return ""
							end
							return string.format("󰭻 %d", cc_status.tokens)
						end,
						cond = function()
							return cc_status.bufnr ~= nil and cc_status.tokens > 0
						end,
						color = { fg = "#a6da95" },
					},
					{
						function()
							return string.format("󰚩 %s", cc_status.model)
						end,
						cond = function()
							return cc_status.bufnr ~= nil and cc_status.model ~= nil and cc_status.model ~= ""
						end,
						color = { fg = "#8aadf4" },
					},
				},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
