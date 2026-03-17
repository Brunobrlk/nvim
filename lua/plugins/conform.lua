return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Load on write pre-hook
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				kotlin = { "ktlint" },
				python = { "ruff", "black" }, -- Add black as an option
				xml = { "xmlformatter" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				dart = { "dart_format" },
				lua = { "stylua" },
				json = { "prettier" }, -- Requires prettier via mason
				markdown = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
