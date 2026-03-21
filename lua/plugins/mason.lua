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
					-- LSP
					"jdtls",
					"kotlin-lsp",
					"groovy-language-server",
					"vim-language-server",
					"jsonls",
					"yamlls",
					"lua_ls",
					"bash-language-server",
					"pyright",

					-- Linters
					"shellcheck",

					-- Formatters
					"shfmt",
					"xmlformatter",
					"prettier",
					"stylua",

					-- Linter/Formatter
					"ktlint",
					"ruff",
				},
				automatic_installation = true, -- Automatically installs missing LSPs
			})
		end,
	},
}
