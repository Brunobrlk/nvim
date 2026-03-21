-- Set keymaps for lsp buffers
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		require("keymaps").setup_lsp_keymaps(event.buf, client)
	end,
})
