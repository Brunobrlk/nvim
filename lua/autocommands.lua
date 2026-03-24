vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local bufnr = event.buf

		-- print("log entered la ele")
		-- print(client.server_info.name)
		-- local test = {
		-- 	"Hello World 1",
		-- 	"Hello World 2",
		-- 	"Hello World 3",
		-- }
		-- vim.ui.select(test, {
		-- 	prompt = "Select something",
		-- }, function(choice)
		-- 	vim.notify("Selected" .. choice, vim.log.levels.WARN, {})
		-- end)
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
