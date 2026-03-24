vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local bufnr = event.buf

		print(vim.lsp.config)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		require("keymaps").setup_lsp_keymaps(bufnr, client)
	end,
})

vim.api.nvim_create_user_command("DiagInfo", function()
	vim.diagnostic.open_float({
		source = true,
	})
end, {})

vim.api.nvim_create_user_command("LspClients", function()
	print(vim.inspect(vim.lsp.get_clients()))
end, {})
