require("lze").load {
	"nvim-lspconfig",
	event = "BufEnter",
	after = function()
		-- todo: general lsp config goes here
		-- todo: define keybinds for lsp operations, ie rename
		local servers = { import = "matoo.lsps.servers" }
		for server, config in pairs(servers) do
			require("lspconfig")[server].setup(config)
		end
	end,
}
