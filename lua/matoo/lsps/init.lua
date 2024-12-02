require("lze").load {
	"nvim-lspconfig",
	event = "BufEnter",
	after = function()
		-- todo: general lsp config goes here
		vim.diagnostic.config {
			update_in_insert = true,
		}
		-- todo: define keybinds for lsp operations, ie rename
		local servers = require("matoo.lsps.servers")
		for server, config in pairs(servers) do
			require("lspconfig")[server].setup(config)
		end
	end,
}
