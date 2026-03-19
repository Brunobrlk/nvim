return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"jdtls", -- This is usually eclipse.jdt.ls, which mason installs as 'jdtls' not 'java_language_server'
					"kotlin-lsp", -- Renamed from 'kotlin-lsp' (often 'kotlin_language_server' or 'kotlinls')
					"groovy-language-server", -- Renamed from 'groovy-language-server'
					"vim-language-server", -- Renamed from 'vim-language-server'
					"json-lsp", -- Renamed from 'json-lsp'
					"pyright",
					"bash-language-server", -- Renamed from 'bash-language-server'
					"ktlint",
					"ruff",
                    "lua_ls",
                    "yamlls",
                    "jsonls",
					"shfmt",
					"xmlformatter",
					"prettier", -- Common formatter, consider adding
					"stylua", -- Lua formatter
				},
				automatic_installation = true, -- Automatically installs missing LSPs
			})
		end,
	},
}
