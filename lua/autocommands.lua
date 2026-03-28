vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local bufnr = event.buf

		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		require("keymaps").setup_lsp_keymaps(bufnr, client)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		require("keymaps").setup_language_keymaps(event.buf)
	end,
})

vim.api.nvim_create_user_command("DiagInfo", function()
	vim.diagnostic.open_float({
		source = true,
	})
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.schedule(function()
			if vim.fn.argc() == 0 then
				require("persistence").load()
			end

			require("neo-tree.command").execute({
				action = "show",
				source = "filesystem",
				position = "left",
				reveal = true,
			})
		end)
	end,
})
