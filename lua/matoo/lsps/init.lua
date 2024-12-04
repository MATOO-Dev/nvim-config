local function GetCapabilities(server)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local cmpCapabilities = require("cmp_nvim_lsp").default_capabilities()
	cmpCapabilities = vim.tbl_deep_extend("force", capabilities, cmpCapabilities)
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	return capabilities
end



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
			require("lspconfig")[server].setup({
				settings = config,
				capabilities = GetCapabilities(server),
				filetypes = (config or {}).filetypes,
				cmd = (config or {}).cmd,
				root_pattern = (config or {}).root_pattern,
			})
		end
	end,
}
